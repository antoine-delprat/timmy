class RenameBirthToChildren < ActiveRecord::Migration[7.0]
  def change
    remove_column :children, :age, :integer
    add_column :children, :birth_date, :date
  end
end
