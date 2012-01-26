class PlayerOwnershipsController < ApplicationController
  before_filter :authenticate_user!  
  # GET /player_ownerships
  # GET /player_ownerships.json
  def index
    @player_ownerships = PlayerOwnership.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_ownerships }
    end
  end

  # GET /player_ownerships/1
  # GET /player_ownerships/1.json
  def show
    @player_ownership = PlayerOwnership.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_ownership }
    end
  end

  # GET /player_ownerships/new
  # GET /player_ownerships/new.json
  def new
    base_player = Player.find(params[:id])
    if current_user.team.budget >= base_player.value #has budget? sign the player
          pre_add_budget = current_user.team.budget
      @player_ownership = PlayerOwnership.new(
                                              :team_id => current_user.team,
                                              :player_id => base_player.id)
        
        current_user.team.budget = (pre_add_budget - base_player.value)
        current_user.team.save!                                                                            

      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_ownership }
               end

    else
       respond_to do |format|
       format.html { redirect_to base_player, notice: "You can't afford #{base_player.name}. Drop another player first." }
               end
    end
  end
  # GET /player_ownerships/1/edit
  def edit
    @player_ownership = PlayerOwnership.find(params[:id])
  end

  # POST /player_ownerships
  # POST /player_ownerships.json
  def create
    base_player = Player.find(params[:id])
    if current_user.team.budget >= base_player.value #has budget? sign the player
          pre_add_budget = current_user.team.budget
    @player_ownership = PlayerOwnership.new(
    :team_id => current_user.team.id,
    :player_id => base_player.id,
    :position => base_player.position
    )
     current_user.team.budget = (pre_add_budget - base_player.value)
    respond_to do |format|
      if @player_ownership.save
        current_user.team.save!
        format.html { redirect_to current_user.team, notice: "You added #{base_player.name}." }
        format.json { render json: @player_ownership, status: :created, location: @player_ownership }
      else
        format.html { render action: "new" }
        format.json { render json: @player_ownership.errors, status: :unprocessable_entity }
      end
    end
    else
       respond_to do |format|
       format.html { redirect_to current_user.team, notice: "You can't afford #{base_player.name}. Drop another player first." }
               end
    end
  end

  # PUT /player_ownerships/1
  # PUT /player_ownerships/1.json
  def update
    @player_ownership = PlayerOwnership.find(params[:id])

    respond_to do |format|
      if @player_ownership.update_attributes(params[:player_ownership])
        format.html { redirect_to @player_ownership, notice: 'Player ownership was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_ownerships/1
  # DELETE /player_ownerships/1.json
  def destroy
    @player_ownership = PlayerOwnership.find(params[:id])  
    @player = Player.find(params[:player_id])
    authorize! :destroy, @player_ownership
      value = @player.value
    pre_drop_budget = current_user.team.budget
    current_user.team.budget = (pre_drop_budget + value)
    current_user.team.save!
    
    @player_ownership = PlayerOwnership.find(params[:id])
    @player_ownership.destroy
    
    
    respond_to do |format|
      format.html { redirect_to current_user.team }
      format.json { head :ok }
    end
  end
end
