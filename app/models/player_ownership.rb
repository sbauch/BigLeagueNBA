class PlayerOwnership < ActiveRecord::Base
  belongs_to :players
  belongs_to :teams
 
  
# # number of players per position validation
# MAX_QB = 1
# MAX_RB = 2
# MAX_WR = 3
# MAX_TE = 1
# MAX_K = 1
# MAX_DEF = 1
# 
#rb_owned_count = self.count(:team_id, :conditions => {:position => "RB"})
# qb_owned = self.where(:position => "QB", :team_id => current_user.team_id )
#                    
# # wr_owned_count = self.count(:team_id, :conditions => {:position => "WR"})
# # te_owned_count = self.count(:team_id, :conditions => {:position => "TE"})
# # k_owned_count = self.count(:team_id, :conditions => {:position => "K"})
# # def_owned_count = self.count(:team_id, :conditions => {:position => "DEF"})
# 
# validate :if => Proc.new { |p| p.position == "QB" }  do
#   if qb_owned.count >= MAX_QB
#     errors.add :team, "can only have #{MAX_QB} QB. Drop another QB first."
#                                                      end
#   end 
#   
# validate :if => Proc.new { |p| p.position == "RB" }  do
#    if rb_owned_count == MAX_RB
#        errors.add :team, "can only have #{MAX_RB} RB. Drop another RB first."
#                                                       end
#    end                          
# #   elsif rb_owned_count >= MAX_RB
# #     errors.add :team, "can only have #{MAX_RB} RB. Drop another RB first."
# #   elsif wr_owned_count >= MAX_WR
# #     errors.add :team, "can only have #{MAX_WR} WR. Drop another WR first."  
# #   elsif te_owned_count >= MAX_TE
# #     errors.add :team, "can only have #{MAX_TE} TE. Drop another TE first."
# #   elsif k_owned_count >= MAX_K
# #     errors.add :team, "can only have #{MAX_TE} K. Drop another K first."
# #   elsif def_owned_count >= MAX_DEF
# #     errors.add :team, "Can only have #{MAX_DEF} DEF. Drop another DEF first."      

end 
