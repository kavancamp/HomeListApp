module ApplicationHelper
    def profile_picture account, width = 150
        thumb = account.image.present? ? account.image.thumbnail.url : "placeholder.jpg"
        image_tag thumb, width: width, class: "profile-pic img-round"

     end
end
