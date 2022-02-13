class Property < ApplicationRecord
  
  belongs_to :account
  has_one_attached :photo
 
 
  #latest properties
  scope :newest, -> {order created_at: :desc}
  
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :address, presence: true, length: {minimum: 3, maximum: 100}
  
  
end
