class AddDatesToChildGames < ActiveRecord::Migration[7.0]
  def change
    add_column :child_games, :start_date, :date
    add_column :child_games, :end_date, :date
  end
end
