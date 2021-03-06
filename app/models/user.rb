class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  

  has_many :notes
  has_many :articles, through: :notes
  has_many :lexicons, through: :notes
end
