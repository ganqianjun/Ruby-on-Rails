require 'httparty'
ENV["FOOD2FORK_KEY"] = '27716641e6368194225c61008534350f'

class Recipe
  include HTTParty

  base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end