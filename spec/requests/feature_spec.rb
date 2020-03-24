# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Feature API tests', type: :request do
  include_context 'create all'

  describe 'GET /gamers/:id/done_feature/:feature_id/in_match/:match_id' do
    let!(:matches) {
      (1..2).map { |el| create(:match, team_ids: [teamone.id, teamtwo.id]) }
    }

    let!(:tags) {
      matches.map { |m|
        (1..25).map { |t| create(:tag,gamer: gamers_1.sample, match: m, feature: feature_list.sample) }
      }
    }

    it 'Top-5 игроков по конкретному показателю в конкретной команде' do
      features = Tag.all.order(id: :desc).select(:feature_id).order(match_id: :desc).pluck(:feature_id).uniq # уник. фичи которые задействованы
      gamers_ids = Gamer.where({team_id: teamone.id}).pluck(:id)
      feature = Feature.find(features.sample)
      tops = feature.tags.includes(:gamer).group(["gamer_id"]).where({gamer_id: gamers_ids}).order(count_all: :desc).limit(Gamer::TOPS).count

      get feature_top_btw_gamers_feature_path(feature.id, teamone.id)
      
      resp = JSON.parse response.body
      resp.each_with_index {|r,i|
        expect(r["id"]).to eq(tops.keys[i])
        expect(r["top"]).to eq(tops.values[i])
      }
    end
  end

  describe 'GET /gamers/:id/feature_for_last_five' do
    let!(:matches) {
      (1..2).map { |el| create(:match, team_ids: [teamone.id, teamtwo.id]) }
    }

    let!(:tags) {
      matches.map { |m|
        (1..25).map { |t| create(:tag,gamer: gamers_1.sample, match: m, feature: feature_list.sample) }
        (1..25).map { |t| create(:tag,gamer: gamers_2.sample, match: m, feature: feature_list.sample) }
      }
    }

    it 'Top-5 игроков по конкретному показателю по всем командам в целом' do
      features = Tag.all.order(id: :desc).select(:feature_id).order(match_id: :desc).pluck(:feature_id).uniq # уник. фичи которые задействованы
      feature = Feature.find(features.sample)
      tops = feature.tags.includes(:gamer).group(["gamer_id"]).order(count_all: :desc).limit(Gamer::TOPS).count

      get top_btw_teams_feature_path(feature.id)

      resp = JSON.parse response.body
      resp.each_with_index {|r,i|
        expect(r["id"]).to eq(tops.keys[i])
        expect(r["top"]).to eq(tops.values[i])
      }
    end

end

end
