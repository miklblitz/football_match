class Tag < ApplicationRecord
  belongs_to :feature
  belongs_to :gamer
  belongs_to :match
end
