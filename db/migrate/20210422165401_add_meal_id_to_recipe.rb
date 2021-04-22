class AddMealIdToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :idMeal, :string 
  end
end
