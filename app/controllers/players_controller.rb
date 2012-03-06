class PlayersController < ApplicationController
  before_filter :authenticate_user!
  def add_player
    base_player = Player.find(params[:id])
  if current_user.team.budget >= base_player.value #has budget? sign the player
        pre_add_budget = current_user.team.budget
        @player = Player.new(:team_id => current_user.team.id, 
                            :name => base_player.name, 
                            :position => base_player.position,
                            :NFL_team => base_player.NFL_team,
                            :value => base_player.value
                            ) 
        current_user.team.budget = (pre_add_budget - base_player.value)
        current_user.team.save!
        respond_to do |format|
          if @player.save
            format.html { redirect_to current_user.team, notice: "You added #{@player.name}." }
            format.json { render json: @player, status: :created, location: @player }
          else
            format.html { render action: "new" }
            format.json { render json: @player.errors, status: :unprocessable_entity }
          end
                   end                      
   else
      respond_to do |format|
      format.html { redirect_to base_player, notice: "You can't afford #{base_player.name}. Drop another player first." }
                 end
   end
end
  
  def drop_player
     @player = Player.find(params[:id])
      value = @player.value
      pre_drop_budget = current_user.team.budget
      current_user.team.budget = (pre_drop_budget + value)
      current_user.team.save!
      @player.destroy
      @team = current_user.team

      respond_to do |format|
        format.html { redirect_to @team, notice: "You dropped #{@player.name}." }
        format.json { head :ok }
      end
    end
    
  # GET /players
  # GET /players.json
  def index
    @centers = Player.where(:position => "C").sort_by { |p| -p.season_fantasy }
    @forwards = Player.where(:position => "F").sort_by { |p| -p.season_fantasy }
    @guards = Player.where(:position => "G").sort_by { |p| -p.season_fantasy }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    value = @player.value
    pre_drop_budget = current_user.team.budget
    current_user.team.budget = (pre_drop_budget + value)
    current_user.team.save!
    @player.destroy
    
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :ok }
    end
  end
end
