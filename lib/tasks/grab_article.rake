require 'rest-client'

namespace :grab_article do
  desc "Pull an article from bing news and create an Article Object using retrieved info"
  task :fetch => :environment do
    response = RestClient.get ENV.fetch("BING_NEWS_URL"), {"Ocp-Apim-Subscription-Key": ENV.fetch("BING_API_KEY")}
    article = JSON.parse(response.body)["value"][0]
    newArticle = Article.new(name: article["name"], url: article["url"], thumbnail: article["image"]["thumbnail"]["contentUrl"])
    newArticle.save
  end
end
