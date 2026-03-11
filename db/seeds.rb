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
