class AddInstructionsToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :strInstructions, :string
  end
end
