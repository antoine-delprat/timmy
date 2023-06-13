class UpdateDateTypeToChildGames < ActiveRecord::Migration[7.0]
  def change
    change_column :child_games, :start_date, :datetime
    change_column :child_games, :end_date, :datetime
  end
end
