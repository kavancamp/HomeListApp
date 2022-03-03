module ApplicationHelper

    #def profile_picture account, width = 150
        #thumb = account.photo.present? ? account.image.thumbnail.url : "placeholder.jpg"
        #image_tag thumb, width: width, class: "profile-pic img-round"

     #end
     def profile_picture(account), width = 150
        account.profile_picture.present? ? polymorphic_url(account.profile_picture) : asset_url("avatar_placeholder.jpeg")
    end
end
