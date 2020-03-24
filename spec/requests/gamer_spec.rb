# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Gamer API tests', type: :request do
  include_context 'create all'

  describe 'GET /gamers/:id/done_feature/:feature_id/in_match/:match_id' do
    let!(:tags) {
      (1..2).map { |el| create(:tag,gamer: gamers_1.sample, match: match, feature: feature_list.sample) }
    }

    it 'игрок выполнил такой-то показатель в матче' do
      exists_gamers = Tag.all.select(:gamer_id).pluck(:gamer_id)
      exists_features = Tag.all.select(:feature_id).pluck(:feature_id)
      non_exists_gamers_ids = gamers_1.pluck(:id) - exists_gamers
      non_exists_features = Feature.all.select(:id).pluck(:id) - exists_features

      get done_feature_gamer_path(tags[0].gamer_id, tags[0].feature_id, tags[0].match_id)
      expect(response.body).not_to be_empty

      get done_feature_gamer_path(tags[1].gamer_id, tags[1].feature_id, tags[1].match_id)
      expect(response.body).not_to be_empty

      get done_feature_gamer_path(non_exists_gamers_ids.first, non_exists_features.first, tags[1].match_id)
      expect(response.body).to be_empty

      get done_feature_gamer_path(non_exists_gamers_ids.first, tags[1].feature_id, tags[1].match_id)
      expect(response.body).to be_empty

      get done_feature_gamer_path(tags[0].gamer_id, non_exists_features.first, tags[1].match_id)
      expect(response.body).to be_empty
    end

  end

  describe 'GET /gamers/:id/feature_for_last_five' do
    # рандомные матчи
    let!(:matches) {
      (1..9).map { |el| create(:match, team_ids: [teamone.id, teamtwo.id]) }
    }

    # рандомные показатели в разных матчах, проверим только игроков из первой команды
    let!(:tags) {
      matches.map { |m|
        (1..2).map { |t| create(:tag,gamer: gamers_1.sample, match: m, feature: feature_list.sample) }
      }
    }

    let!(:gamer1_non_played) { create(:gamer, team: teamone) } # у этого игрока нет показателей
    let!(:unused_featute) { create(:feature) } # не использованная способность

    it 'выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды !переделать' do
      match_ids = Match::fetch_match_ids
      tags_for_last_five_matches = Tag.all.order(id: :desc).select(:gamer_id).where(match_id: match_ids)
      exists_gamers =  tags_for_last_five_matches.pluck(:gamer_id).uniq # id игроков с показателями в последних 5 матчах
      exists_features = tags_for_last_five_matches.pluck(:feature_id).uniq # id показателей в последних 5 матчах

      get feature_for_last_five_gamer_path(exists_gamers[0], exists_features[0])
      expect(response.body).not_to be_empty

      get feature_for_last_five_gamer_path(gamer1_non_played, exists_features[0])
      expect(response.body).to be_empty

      get feature_for_last_five_gamer_path(exists_gamers[0], unused_featute)
      expect(response.body).to be_empty
    end

  end

end
