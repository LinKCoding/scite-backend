class Api::V1::DictionaryController < ApplicationController
  skip_before_action :authorized


  def define
    url = "https://owlbot.info/api/v1/dictionary/#{params[:word]}"

    response = RestClient.get(url, headers={'Accept' => 'application/json'})
    response = JSON.parse(response)

    render json: response
    # @articles = Article.all
    # render json: @articles
  end


end
