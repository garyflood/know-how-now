module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    md = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, fenced_code_blocks: true)
    md.render(text).html_safe
  end

  # Renders category image, or default placeholder when the category image file is missing.
  def category_image_tag(category, **options)
    path = category.image.present? ? "categories/#{category.image}" : "categories/default.png"
    source = Rails.root.join("app/assets/images", path)
    path = "categories/default.png" unless File.exist?(source)
    image_tag(path, **options)
  end

  # Renders device image, or category image when the device has no images.
  def device_image_tag(device, **options)
    if device.images.present?
      image_tag(device.images.first, **options)
    else
      category_image_tag(device.category, **options)
    end
  end
end
