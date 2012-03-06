class AddTotalToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :fantasy_points_total, :float, :default => 0
  end
end
