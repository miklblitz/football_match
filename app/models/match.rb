class Match < ApplicationRecord
  has_many :tags
  has_and_belongs_to_many :teams
  has_many :gamers, through: :teams
  has_many :tags, through: :gamers

  validates_presence_of :name

  LAST_MATCH_LIMIT = 5

  def self.fetch_match_ids
    order(created_at: :desc).limit(LAST_MATCH_LIMIT).pluck(:id)
  end

end
