class AddValueAndBudget < ActiveRecord::Migration
  def up
    add_column :players, :value, :integer
    add_column :teams, :budget, :integer, :default => "1000"
  end

  def down
  end
end
