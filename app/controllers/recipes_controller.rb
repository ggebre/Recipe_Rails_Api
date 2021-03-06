class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]
  before_action :authorized
  # GET /recipes
  def index
    @recipes = Recipe.all

    render json: @recipes, :include => {:ingredients => {:only => :name}}
  end

  # GET /recipes/1
  def show
    render json: @recipe
  end

  # POST /recipes
  def create
    
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    
    @recipe.ingredients.destroy_all 
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:strMeal, :idMeal, :strMealThumb, :strInstructions, ingredients_attributes: [:name])
    end
end
