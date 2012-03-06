class PlayerOwnership < ActiveRecord::Base
  belongs_to :players
  belongs_to :teams
 
  # validate :quantity_of_position
  # 
  # MAX_C = 2
  # MAX_F = 3
  # MAX_G = 3
#   
# def quantity_of_position
#   if new_record? && PlayerOwnership.where(:position => "C", :team_id => team_id).size >= MAX_C
#           errors.add :team, "cannot have more than #{MAX_C} centers."
#         end
#   if new_record? && PlayerOwnership.where(:position => "F", :team_id => team_id).size >= MAX_F
#           errors.add :team, "cannot have more than #{MAX_F} centers."
#     end
#     if new_record? && PlayerOwnership.where(:position => "G", :team_id => team_id).size >= MAX_G
#             errors.add :team, "cannot have more than #{MAX_G} centers."
#             end        
#       end    
end 
