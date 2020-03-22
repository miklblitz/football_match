class CreateGamers < ActiveRecord::Migration[5.2]
  def change
    create_table :gamers do |t|
      t.string :name
      t.integer :age
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
