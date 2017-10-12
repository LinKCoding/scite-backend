class User < ApplicationRecord
  has_secure_password

  has_many :notes
  has_many :articles, through: :notes
  has_many :lexicons, through: :notes
end
