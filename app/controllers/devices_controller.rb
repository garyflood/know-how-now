class DevicesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @device = Device.find(params[:id])
    @device.increment!(:views)
  end

  # rubocop:disable Metrics/MethodLength
  def create
    @device = Device.new(device_params)

    chat = RubyLLM.chat
    category_names = Category.pluck(:category_name).join("\n")

    category_name = chat.ask(
      "Which of the following categories best describes a '#{@device.name}'? " \
      "Reply with ONLY the category name, exactly as written:\n#{category_names}"
    ).content.strip

    @device.category = Category.find_by(category_name: category_name) ||
                       Category.find_by(category_name: "Personal Computers")

    chat.with_instructions(
      "You are an expert in using devices. Give step by step instructions to use a device. Answer concisely in Markdown."
    )
    @device.text_instructions = chat.ask("How do I use a #{@device.name}?").content

    if @device.save
      flash[:notice] = "Device was successfully added with instructions!"
      redirect_to device_path(@device)
    else
      flash.now[:alert] = "There was a problem adding the device."
      render "pages/home", status: :unprocessable_entity
    end
  rescue StandardError => e
    flash.now[:alert] = "Unable to generate instructions: #{e.message}"
    render "pages/home", status: :unprocessable_entity
  end
  # rubocop:enable Metrics/MethodLength

  private

  def device_params
    params.require(:device).permit(:name)
  end
end
