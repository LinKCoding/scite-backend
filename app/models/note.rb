class Note < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :lexicons
  
end
