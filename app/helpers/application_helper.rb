module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    md = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, fenced_code_blocks: true)
    md.render(text).html_safe
  end

  # Renders category image, or default placeholder when the category image file is missing.
  def category_image_tag(category, **options)
    path = category.image.present? ? "categories/#{category.image}" : "categories/_default.png"
    source = Rails.root.join("app/assets/images", path)
    path = "categories/_default.png" unless File.exist?(source)
    image_tag(path, **options)
  end

  # Transforms a Cloudinary URL to serve a resized thumbnail instead of full resolution.
  # Inserts w_/h_/c_fill/q_auto/f_auto transformations into the upload path segment.
  def cloudinary_thumb(url, width: 400, height: 300)
    return url if url.blank?
    return url unless url.include?("cloudinary.com/") && url.include?("/upload/")

    # Insert transformation params right after /upload/ — keeps the version number intact
    url.sub("/upload/", "/upload/w_#{width},h_#{height},c_fill,q_auto,f_auto/")
  end

  # Renders a device thumbnail using the uploaded device photo (Cloudinary),
  # or falls back to the category image when no photo has been uploaded yet.
  def device_image_tag(device, width: 400, height: 300, **options)
    if device.images.present?
      thumb = cloudinary_thumb(device.images.first, width: width, height: height)
      image_tag(thumb, **options)
    else
      category_image_tag(device.category, **options)
    end
  end
end
