class Api::V1::LexiconsController < ApplicationController
  before_action :authorized

  def create

    if @user

      @note = Note.find_by(id: params[:note_id])
      # @lexicon = @note.lexicons
      @newWord = Lexicon.create(word: params[:word], definition: params[:definition], note_id: @note.id)
      render json: @newWord
    end
  end


end
