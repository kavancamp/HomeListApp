class Account < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :trackable, :confirmable

  has_one_attached :profile_picture 
  has_many :properties
  has_many :photos, through: :properties
  has_many :messages, through: :conversations

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def company 
    "test"
  end

end
