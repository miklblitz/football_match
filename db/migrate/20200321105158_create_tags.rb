class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :feature, foreign_key: true
      t.references :gamer, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
    #add_index :tags, [:feature_id, :gamer_id, :match], unique: true
  end
end
