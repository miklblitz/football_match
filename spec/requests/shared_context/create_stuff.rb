shared_context 'create all' do
  let!(:teamone) { create(:team, name: 'Arsenal') }
  let!(:teamtwo) { create(:team, name: 'Manchester') }
  let!(:feature_list) { create_list(:feature, 6) }
  let!(:match) { create(:match, team_ids: [teamone.id, teamtwo.id]) }
  let!(:gamers_1) { create_list(:gamer, 6, team: teamone) }
  let!(:gamers_2) { create_list(:gamer, 6, team: teamtwo) }
end
