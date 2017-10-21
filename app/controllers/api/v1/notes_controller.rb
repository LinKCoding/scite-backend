class Api::V1::NotesController < ApplicationController
  before_action :authorized

  def create
    if @user

      @article = Article.find_by(id: params[:article_id])
      @note = Note.new(user_id: @user.id, article_id: @article.id, content: '{"entityMap":{}, "blocks":[{"key":"ctf9b", "text":"I learned about...", "type":"unstyled", "depth":0, "inlineStyleRanges":[], "entityRanges":[], "data":{}}]}')
      if @note.save
        render json: { note: @note }
      else
        render json: { error: "you can't make more than one article per note "}
      end
    end
  end

  def update
    if @user
      @note = Note.find_by(id: params[:id])
      @note.content = params[:content]
      @note.save

      render json: { note: @note}
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

  def delete
    if @user
      @note = Note.find_by(id: params[:id])
      @note.destroy

      render json: @user.notes
    end
  end
end
