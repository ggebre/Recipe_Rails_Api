class RenameNameAndImageOfRecipe < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :name, :strMeal 
    rename_column :recipes, :image, :strMealThumb 
  end
end
