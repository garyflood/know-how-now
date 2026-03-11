# Category images

Place one image per category here. The filename must match the value stored in the database (`category.image`), e.g.:

- `personal_computers.png`
- `smartphones_tablets.png`
- `smartwatches_wearables.png`
- … (see seeds: slug is `category_name.parameterize.gsub("-", "_")` + `.png`)

Use **default.png** as the fallback when a category has no image or the file is missing. Icons should match the app’s color scheme and style.
