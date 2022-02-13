module PropertiesHelper

  def property_thumbnail(property)
    photo = property.photo.present? ? property.photo. : "placeholder.png"
    image_tag photo, class: "property-thumb"
  end

  def property_photo_url(property)
    property.photo.present? ? polymorphic_url(property.photo) : asset_url("/placeholder.png")
  end
  
end