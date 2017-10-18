class Api::V1::LexiconsController < ApplicationController
  before_action :authorized

  def create
    if @user
      @note.find_by(id: params[:note_id])
      @lexicon = @note.lexicons
      newWord = Lexicon.create(word: params[:word, definition: params[:definition]], note_id: @note.id)
      @lexicon << newWord
      byebug
      render json: @lexicon
    end
  end


end
