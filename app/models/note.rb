class Note < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :lexicons

  # validates :article_id, uniqueness: {
  #   scope: :user_id,
  #   message: "you can only make one article per note"
  # }, on: :create
end
