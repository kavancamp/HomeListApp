class Property < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :address, presence: true, length: {minimum: 3, maximum: 100}

  mount_uploader :photo, PhotoUploader
  belongs_to :account
  
  scope :newest, -> {order created_at: :desc}
  
end
