class Game < ActiveRecord::Base
  validates_numericality_of :fgs, :threepointers, :rebs, :assists, :blocks, :steals, :turnovers
  belongs_to :player, :class_name => "Player", :foreign_key => 'player_name', 
             :primary_key => 'name'
  after_save :update_player_totals



 private 
  def update_player_totals
     Player.update_counters player.id,
     :fgs_sum => fgs,
     :threepointers_sum  => threepointers,
     :rebs_sum  => rebs,
     :assists_sum  => assists,
     :blocks_sum  => blocks,
     :steals_sum  => steals,
     :turnovers_sum => turnovers
    end
       
  # def update_team_totals
  #   Team.update_counters 
  #   :fgs_sum => fgs,
  #   :threepointers_sum  => threepointers,
  #   :rebs_sum  => rebs,
  #   :assists_sum  => assists,
  #   :blocks_sum  => blocks,
  #   :steals_sum  => steals,
  #   :turnovers_sum => turnovers    
  #   end 
end
