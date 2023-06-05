class ChildGame < ApplicationRecord
  belongs_to :child
  belongs_to :game
end
