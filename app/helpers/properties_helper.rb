module PropertiesHelper

  def property_thumbnail(property)
    photo = property.photo.present? ? property.photo : "placeholder.png"
    image_tag photo, class: "bd-placeholder-img card-img-top", width: "100%", height: "225"
  end

  def property_photo_url(property)
    property.photo.present? ? polymorphic_url(property.photo) : asset_url("property_banner_placeholder.png")
  end

end