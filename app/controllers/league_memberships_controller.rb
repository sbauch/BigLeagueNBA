class LeagueMembershipsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @leaguemembership = LeagueMembership.find(params[:id])
    respond_to do |format|
      format.html # show.html.erbrequire File.dirname(__FILE__) + '/league_memberships_controller'
      
      format.json { render json: @player_ownership }
    end
  end
  def create
     league = League.find(params[:id])
     teamid = Team.where(:user_id => current_user.id)[0].id
     @league_membership = LeagueMembership.new(
      :team_id => teamid,
      :league_id => league 
      ) 
  
      respond_to do |format|
        if @league_membership.save
          current_user.team.save!
          format.html { redirect_to current_user.team, notice: "You joined #{league.name}." }
        else
          format.html { render action: "new" }
          format.json { render json: @league_membership.errors, status: :unprocessable_entity }
        end
      end
  end
  
  
  
end