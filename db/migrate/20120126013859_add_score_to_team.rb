class AddScoreToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :fantasy_points, :float, :default => 0
  end
end
