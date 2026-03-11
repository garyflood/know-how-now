class DevicesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @device = Device.find(params[:id])
    @device.increment!(:views)
  end

  # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
  def create
    @device = Device.new(device_params)

    existing = Device.find_by(name: @device.name)
    if existing
      flash[:notice] = "We already have instructions for #{existing.name}!"
      redirect_to device_path(existing) and return
    end

    category_names = Category.pluck(:category_name).join("\n")

    prompt = <<~PROMPT
      A user has entered the following device name: "#{@device.name}"

      Respond with a JSON object (no markdown, no code fences) with exactly these keys:
      - "is_device": true if this is a real device, false if it is not
      - "exact_model": the brand and model number only (e.g. "Toshiba EM131A5C-SS"), with no device type or description appended (null if not a device)
      - "category": which of the following categories best describes it (reply with ONLY the category name exactly as written): #{category_names}
      - "instructions": step by step instructions for how to use this device, written concisely in Markdown
      - "related_devices": an array of 5-7 specific brand and model numbers (e.g. "Toshiba EM131A5C-SS") that the user may have been referring to instead — other real models that match their input
    PROMPT

    response = JSON.parse(RubyLLM.chat.ask(prompt).content)

    raise "\"#{@device.name}\" does not appear to be a device." unless response["is_device"]
    raise "Could not identify an exact model for \"#{@device.name}\"." if response["exact_model"].blank?

    @device.name = response["exact_model"]

    existing = Device.find_by(name: @device.name)
    if existing
      flash[:notice] = "We already have instructions for #{existing.name}!"
      redirect_to device_path(existing) and return
    end

    @device.category = Category.find_by(category_name: response["category"]) ||
                       Category.find_by(category_name: "Personal Computers")
    @device.text_instructions = response["instructions"]
    @device.related_devices = Array(response["related_devices"])

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
  # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity

  private

  def device_params
    params.require(:device).permit(:name)
  end
end
