class Api::V1::NotesController < ApplicationController

  def create
    if @user
      @article = Article.find_by(id: params[:article_id])
      @note = Note.create(user_id: @user.id, article_id: @article.id)
      render json: { note: @note }
    end
  end
end
