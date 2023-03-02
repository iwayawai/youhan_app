class Public::RecipesController < ApplicationController
  
  def new
    @recipe=Recipe.new
    @genres=Genre.all
  end
  

end
