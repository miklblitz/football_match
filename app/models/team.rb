class Team < ApplicationRecord
  has_many :gamers
  has_and_belongs_to_many :matches
  
  validates_presence_of :name
end
