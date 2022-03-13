module PropertiesHelper

  def property_thumbnail(property)
    photo = property.photo.present? ? property.photo : "placeholder.png"
    image_tag photo, class: "bd-placeholder-img card-img-top", width: "100%", height: "225"
  end

  def property_photo_url(property)
    property.photo.present? ? polymorphic_url(property.photo) : asset_url("property_banner_placeholder.png")
  end

  def display_price(price)
    display_amnt = number_to_currency(price, :precision => 0) 
  end

  def calculate_repayment(price)
      downpayment = price * 0.20
      price = price - downpayment
      repayment = price / 360
      repayment = display_price(repayment)
  end



  def get_property_price(property_price)
      "Contact Agent" and return if property_price.nil? 
      if property_price > 0
          if @property.for_sale
              display_price = display_price(property_price)
          else
              display_price = "#{display_price(property_price)} / Month"
          end
      else 
          display_price = "Contact Agent"
      end
  end
end