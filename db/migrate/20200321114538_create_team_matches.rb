class CreateTeamMatches < ActiveRecord::Migration[5.2]
  def change
    create_table(:matches_teams, :id=>false) do |t|
      t.references :team, foreign_key: true
      t.references :match, foreign_key: true
    end
    add_index :matches_teams, [:team_id, :match_id], unique: true
  end
end