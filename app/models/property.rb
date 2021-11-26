class Property < ApplicationRecord
  
  mount_uploader :photo, ImageUploader
  belongs_to :account
  

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :address, presence: true, length: {minimum: 3, maximum: 100}
end
