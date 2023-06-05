class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :first_name
      t.integer :age
      t.integer :screen_time_per_week
      t.boolean :alarm
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
