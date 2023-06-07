class Child < ApplicationRecord
  belongs_to :user
  has_many :child_games
  has_many :games, through: :child_games
  has_one_attached :avatar
  validates :first_name, presence: true
  validates :birth_date, presence: true
end
