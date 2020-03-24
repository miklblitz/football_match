class Feature < ApplicationRecord
  has_many :tags
  has_many :gamers, through: :tags
  
  validates_presence_of :name
end