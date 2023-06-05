class Game < ApplicationRecord
  has_many :child_games
  has_many :children, through: :child_games
  has_one_attached :photo
end
