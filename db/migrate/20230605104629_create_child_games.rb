class CreateChildGames < ActiveRecord::Migration[7.0]
  def change
    create_table :child_games do |t|
      t.integer :score
      t.references :child, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.timestamps
    end
  end
end
