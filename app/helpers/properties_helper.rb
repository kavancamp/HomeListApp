@ -1,15 +1,17 @@
module PropertiesHelper

  def property_thumbnail property
    img = property.photo.present? ? property.photo.thumb.url : "placeholder.png"
    image_tag img, class: "property-thumb"

  def property_photo_url property
    img = property.photo.present? ? property.photo.thumb.url : "placeholder.png"
  end

  def property_thumbnail_url property
    property.photo.present? ? property.photo.thumb.url : "placeholder.png"
  end
end