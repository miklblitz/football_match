class Feature < ApplicationRecord
  has_many :tags
  has_many :gamers, through: :tags
  
  validates_presence_of :name

  def top_five_in_teams(gamers_ids)
    tags.includes(:gamer).group(["gamer_id"]).where({gamer_id: gamers_ids}).order(count_all: :desc).limit(Gamer::TOPS).count
  end

  def top_five_btw_teams()
    tags.includes(:gamer).group(["gamer_id"]).order(count_all: :desc).limit(Gamer::TOPS).count
  end

end