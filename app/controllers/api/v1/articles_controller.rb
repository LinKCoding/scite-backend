class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authorized


  def index
    @articles = Article.all
    render json: @articles
  end


end
