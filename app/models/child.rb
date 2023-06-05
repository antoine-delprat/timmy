class Child < ApplicationRecord
  belongs_to :user
  has_many :child_games
  has_many :games, through: :child_games
  validates :first_name, presence: true
  validates :age, presence: true
end
