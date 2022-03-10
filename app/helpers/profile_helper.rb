module ProfileHelper

    def profile_picture_url(account)
        account.profile_picture.present? ? polymorphic_url(account.profile_picture) : "profile_picture_placeholder.jpeg"
        image_tag profile_picture, class: "rounded-circle", width: "20%"
    end

end