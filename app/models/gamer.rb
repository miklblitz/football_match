class Gamer < ApplicationRecord
  belongs_to :team
  has_many :tags
  has_many :features, through: :tags

  validates_presence_of :name
  validates_presence_of :age

  TOPS = 5
  
  def gamer_done_feature(match_id, feature_id)
    tags.where({match_id: match_id, feature_id: feature_id})
  end

  def done_in_matches(match_ids, feature_id)
    tags.where({match_id: match_ids, feature_id: feature_id})
  end

  def self.for_team(team_id) 
    where({team_id: team_id}).pluck(:id)
  end
end
