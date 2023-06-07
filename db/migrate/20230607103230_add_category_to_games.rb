class AddCategoryToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :category, :string
  end
end
