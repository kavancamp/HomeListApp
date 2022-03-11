class Property < ApplicationRecord
  
  #Relationship
  belongs_to :account
  has_one_attached :photo
 
  scope :latest, -> { order created_at: :desc }
  scope :sold, -> { where for_sale: true, status: "sold" }
  scope :for_sale, -> { where for_sale: true, status: "avaliable" }
  scope :leased, -> { where for_sale: false, status: "leased" }
  scope :for_rent, -> { where for_sale: false, status: "avaliable" }
  scope :avaliable, -> { where status: "avaliable" }

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :address, presence: true, length: {minimum: 3, maximum: 100}
  
  def self.search(search)
    where("lower(properties.name) LIKE :search OR lower(properties.name) LIKE :search ", search: "%#{search.downcase}%").uniq
  end
end
