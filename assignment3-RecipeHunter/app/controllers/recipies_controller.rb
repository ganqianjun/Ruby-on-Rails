class RecipiesController < ApplicationController
  def index
    keyword = "chocolate"

    if search_param
      keyword = search_param
    end

    @recipes = Recipe.for(keyword)
  end

  def search_param
    params[:search]
  end
end
