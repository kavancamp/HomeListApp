class Property < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :address, presence: true, length: {minimum: 3, maximum: 100}
  
  belongs_to :account
  has_many_attached :photo
  has_many_attached :photo
 

  scope :newest, -> {order created_at: :desc}
  
  
end
