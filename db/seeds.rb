# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  "Personal Computers",
  "Smartphones & Tablets",
  "Smartwatches & Wearables",
  "Home Entertainment",
  "Kitchen Appliances",
  "Home Comfort Devices",
  "Cleaning Appliances",
  "Smart Home Gadgets",
  "Office Equipment",
  "Networking Gear",
  "Health & Fitness Devices",
  "Medical Equipment",
  "Automotive Tech",
  "Outdoor & Garden Tools",
  "DIY & Power Tools",
  "Audio & Music Devices",
  "Cameras & Photography Gear",
  "Gaming Accessories",
  "Travel & Portable Gadgets",
  "Industrial & Workplace Tools"
].each do |name|
  slug = name.parameterize.gsub("-", "_")
  Category.find_or_create_by!(category_name: name).update!(image: "#{slug}.png")
end

# Seed a few example devices so Explore has something to show (optional for testing)
def seed_devices
  return if Device.any?

  categories = Category.all.index_by(&:category_name)
  devices = [
    [ "Personal Computers", "MacBook Pro", "1. Press the power button. 2. Sign in with your password or Touch ID. 3. Use the trackpad or connect a mouse." ],
    [ "Personal Computers", "Windows Laptop", "1. Open the lid and press the power button. 2. Enter your PIN or password. 3. Use the touchpad or plug in a mouse." ],
    [ "Smartphones & Tablets", "iPhone", "1. Press the side button to wake. 2. Swipe up or enter passcode. 3. Tap apps on the home screen." ],
    [ "Kitchen Appliances", "Microwave", "1. Place food in a microwave-safe container. 2. Set time and power level. 3. Press Start." ],
    [ "Smart Home Gadgets", "Smart Speaker", "1. Plug in and wait for the voice prompt. 2. Open the companion app to connect Wi‑Fi. 3. Say the wake word to ask questions or play music." ]
  ]

  devices.each do |cat_name, name, instructions|
    cat = categories[cat_name]
    next unless cat
    Device.find_or_create_by!(name: name, category_id: cat.id) do |d|
      d.text_instructions = instructions
    end
  end
end
seed_devices
