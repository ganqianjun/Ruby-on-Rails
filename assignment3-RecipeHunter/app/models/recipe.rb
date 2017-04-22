class Recipe < ActiveRecord::Base
  include HTTParty

  hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || "www.food2fork.com"
  default_params key: ENV["FOOD2FORK_KEY"] || "27716641e6368194225c61008534350f"
  base_uri "http://#{hostport}/api"
  format :json

  def self.for keyword
    get("/search", query: {q: keyword})["recipes"]
  end
end