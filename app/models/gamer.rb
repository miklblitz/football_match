class Gamer < ApplicationRecord
  belongs_to :team
  has_many :tags
  has_many :features, through: :tags
end
