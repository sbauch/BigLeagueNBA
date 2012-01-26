class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :nba_team
      t.string :position
      t.integer :team_id

      t.timestamps
    end
  end
end
