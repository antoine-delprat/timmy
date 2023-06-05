class Game < ApplicationRecord
  has_many :children, through: :child_games
end
