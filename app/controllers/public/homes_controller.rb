class Public::HomesController < ApplicationController

  def top
    @user = current_user
    @recipes = []
    3.times do |star|
      @recipes << Recipe.find(Favorite.joins(:recipe).where("recipes.star = ?", star + 1).group(:recipe_id).order('count(recipe_id) desc').limit(1).pluck(:recipe_id))
    end
    # convert nested array to even 
    @recipes.flatten!
  end

  def about
    @user = current_user
  end

end
