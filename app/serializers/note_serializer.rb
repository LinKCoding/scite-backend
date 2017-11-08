class NoteSerializer < ActiveModel::Serializer
  attributes :id, :article_id, :content, :user_id, :article_name, :date_created

  def article_name
    article = Article.find_by(id: object.article_id)
    if article
      article.name
    else
      nil
    end
  end

  def date_created
    object.created_at.to_date
  end
end
