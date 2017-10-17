class Lexicon < ApplicationRecord
  belongs_to :note

  def article
    self.note.article
  end
end
