class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :fgs
      t.integer :threepointers
      t.integer :rebs
      t.integer :assists
      t.integer :blocks
      t.integer :steals
      t.integer :turnovers
      t.integer :player_id
      t.datetime :date
      t.string :opponent

      t.timestamps
    end
  end
end
