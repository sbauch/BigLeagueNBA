class CreatePlayerOwnerships < ActiveRecord::Migration
  def change
    create_table :player_ownerships do |t|
      t.integer :player_id
      t.integer :team_id

      t.timestamps
    end
  end
end
