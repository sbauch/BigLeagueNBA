class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.integer :wins
      t.integer :losses
      t.boolean :complete
      t.float :points

      t.timestamps
    end
  end
end
