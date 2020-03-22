class Match < ApplicationRecord
  has_many :tags
  has_and_belongs_to_many :teams
  has_many :gamers, through: :teams
  has_many :tags, through: :gamers
end
