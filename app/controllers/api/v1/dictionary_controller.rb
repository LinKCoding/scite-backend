class Api::V1::DictionaryController < ApplicationController
  skip_before_action :authorized


  def define
    url = "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{params[:word]}"

    response = RestClient.get(url, headers={'Accept' => 'application/json', 'app_id' => ENV["OXFORD_DICT_APP_ID"], 'app_key' => ENV["OXFORD_DICT_KEY"]})
    response = JSON.parse(response)["results"][0]
    byebug
    response[0]['lexicalEntries'].map { |entry| {definition: entry["l
exicalCategory"]} }

    render json: response
    # @articles = Article.all
    # render json: @articles
  end


end
