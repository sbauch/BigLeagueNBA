class AddPositionToPlayerOwnerships < ActiveRecord::Migration
  def change
  add_column :Player_ownerships, :position, :string
  end
end
