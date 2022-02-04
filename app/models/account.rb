class Account < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :trackable, :confirmable
    
  has_many :properties

  def company 
    "test"
  end

end
