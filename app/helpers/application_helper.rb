module ApplicationHelper

     def profile_picture(account)
        account.profile_picture.present? ? polymorphic_url(account.profile_picture) : asset_url("avatar_placeholder.jpeg")
        image_tag thumb, width: width, class: "profile-pic img-round"
    end

end
