class Feature < ApplicationRecord
  has_many :tags
  has_many :gamers, through: :tags
end
# Tag.group(["feature_id", "gamer_id"]).where(feature_id: 2).order(count_id: :desc).limit(5).count(:id)