# frozen_string_literal: true

class VideosController < ApplicationController
  before_action :authenticate_user!

  def new
    @categories = Category.order(:category_name)
  end

  def create
    target_name = params[:target_model_name]&.strip
    if target_name.blank?
      flash.now[:alert] = "Please enter the target model name."
      @categories = Category.order(:category_name)
      render :new, status: :unprocessable_entity
      return
    end

    category = Category.find_by(category_name: params[:category_id]) ||
               Category.find_by(category_name: "Personal Computers")
    device = Device.find_or_initialize_by(name: target_name)
    device.category = category
    device.text_instructions = device.persisted? ? device.text_instructions : "Video tutorial available. See attached script for written instructions."
    device.related_devices = device.related_devices || []

    if device.new_record? && !device.save
      flash.now[:alert] = "Could not save device: #{device.errors.full_messages.to_sentence}"
      @categories = Category.order(:category_name)
      render :new, status: :unprocessable_entity
      return
    end

    device.save! if device.changed?

    photo_urls = upload_device_photos(params[:device_photos])
    if photo_urls.any?
      device.update_column(:images, (device.images + photo_urls).uniq)
    end

    tags = parse_tags(params[:tags])
    tags = ["creator-submission"] if tags.empty?

    video_url = upload_video_to_cloudinary(params[:video_file]) if params[:video_file].present?

    video = Video.new(
      user: current_user,
      device: device,
      script: "See attached script.",
      summary: "Video tutorial for #{device.name}",
      tags: tags,
      views: 0,
      source: video_url
    )

    if video.save
      flash[:notice] = "Your submission has been submitted for review. Thank you!"
      redirect_to profile_path
    else
      flash.now[:alert] = "Could not save submission: #{video.errors.full_messages.to_sentence}"
      @categories = Category.order(:category_name)
      render :new, status: :unprocessable_entity
    end
  rescue StandardError => e
    flash.now[:alert] = "Something went wrong: #{e.message}"
    @categories = Category.order(:category_name)
    render :new, status: :unprocessable_entity
  end

  private

  def parse_tags(tags_param)
    return [] if tags_param.blank?
    tags_param.to_s.split(/[\n,]/).map(&:strip).reject(&:blank?).uniq
  end

  def upload_device_photos(files)
    return [] if files.blank?
    Array(files).filter_map do |file|
      next if file.blank? || !file.respond_to?(:read)
      result = ::Cloudinary::Uploader.upload(
        StringIO.new(file.read),
        folder: "know-how-now/devices",
        resource_type: "image"
      )
      result["secure_url"]
    rescue StandardError => e
      Rails.logger.error "Cloudinary photo upload failed: #{e.message}"
      nil
    end
  end

  def upload_video_to_cloudinary(file)
    return nil if file.blank? || !file.respond_to?(:read)
    result = ::Cloudinary::Uploader.upload(
      StringIO.new(file.read),
      folder: "know-how-now/videos",
      resource_type: "video"
    )
    result["secure_url"]
  rescue StandardError => e
    Rails.logger.error "Cloudinary video upload failed: #{e.message}"
    nil
  end
end
