class AddStatstoPlayers < ActiveRecord::Migration
  def up
  end
  add_column :players, :fgs_sum, :integer, :default => 0
  add_column :players, :three_ponters_sum, :integer, :default => 0
  add_column :players, :rebs_sum, :integer, :default => 0
  add_column :players, :assists_sum, :integer, :default => 0
  add_column :players, :blocks_sum, :integer, :default => 0
  add_column :players, :steals_sum, :integer, :default => 0
  add_column :players, :turnovers_sum, :integer, :default => 0
  
  def down
  end
end
