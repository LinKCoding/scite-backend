class Article < ApplicationRecord
  has_many :notes
  has_many :users, through: :notes
  has_many :lexicons, through: :notes
end
