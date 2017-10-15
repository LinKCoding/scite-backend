class Api::V1::NotesController < ApplicationController
  before_action :authorized

  def create
    if @user
      @article = Article.find_by(id: params[:article_id])
      @note = Note.create(user_id: @user.id, article_id: @article.id)
      render json: { note: @note }
    end
  end

  def article
    if @user

      @note = Note.find_by(id: params[:id])
      @article = @note.article
      @lexicons = @note.lexicons

      render json: {note: @note, article: @article, lexicon: @lexicons}
    end
  end
end
