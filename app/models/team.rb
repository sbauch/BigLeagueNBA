class Team < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :player_ownerships
  has_many :leage_memberships
  has_many :leagues, :through => :league_memberships
  has_many :players, :through => :player_ownerships
  
  #complete scope
  
public


def c
 unless self.c_count == 2
    player = self.player_ownerships.where(:position => "C")[0].player_id
    @oid = self.player_ownerships.where(:position => "C")[0].id
   @name = Player.where(:id => player)[0].name
    @position = "C"
    @nba =  Player.where(:id => player)[0].nba_team
    @id = player
    player = Array.new([@name, @position, @nba_team, @oid, @id])
 else 
 players = self.player_ownerships.where(:position => "C")
 c1 = players[0].player_id
 c2 = players[1].player_id
 
 c1_oid = self.player_ownerships.where(:position => "C")[0].id
 c2_oid = self.player_ownerships.where(:position => "C")[1].id

 c1_name = Player.where(:id => c1)[0].name
 c2_name = Player.where(:id => c2)[0].name
 
 @position = "C"
  
 c1_nba_team =  Player.where(:id => c1)[0].nba_team
 c2_nba_team =  Player.where(:id => c2)[0].nba_team
 
 c1_id = c1
 c2_id = c2 
 
 two_player = Array.new([c1_name, @position, c1_nba_team, c1_oid, c1_id, c2_name, @position, c2_nba_team, c2_oid, c2_id])
 end  
end 

def c_count
  self.player_ownerships.where(:position => "C").size
end

def f
 if self.f_count == 0
 elsif self.f_count == 1
    player = self.player_ownerships.where(:position => "F")[0].player_id
    @oid = self.player_ownerships.where(:position => "F")[0].id
   @name = Player.where(:id => player)[0].name
    @position = "F"
    @nba =  Player.where(:id => player)[0].nba_team
    @id = player
    player = Array.new([@name, @position, @nba_team, @oid, @id])
    
 elsif self.f_count == 2 
 players = self.player_ownerships.where(:position => "F")
 f1 = players[0].player_id
 f2 = players[1].player_id
 
 f1_oid = self.player_ownerships.where(:position => "F")[0].id
 f2_oid = self.player_ownerships.where(:position => "F")[1].id

 f1_name = Player.where(:id => f1)[0].name
 f2_name = Player.where(:id => f2)[0].name
 
 @position = "F"
  
 f1_nba_team =  Player.where(:id => f1)[0].nba_team
 f2_nba_team =  Player.where(:id => f2)[0].nba_team
 
 f1_id = f1
 f2_id = f2 
 
 two_player = Array.new([f1_name, @position, f1_nba_team, f1_oid, f1_id, f2_name, @position, f2_nba_team, f2_oid, f2_id]) 
 elsif self.f_count == 3 
  players = self.player_ownerships.where(:position => "F")
  f1 = players[0].player_id
  f2 = players[1].player_id
  f3 = players[2].player_id  

  f1_oid = self.player_ownerships.where(:position => "F")[0].id
  f2_oid = self.player_ownerships.where(:position => "F")[1].id
  f3_oid = self.player_ownerships.where(:position => "F")[2].id

  f1_name = Player.where(:id => f1)[0].name
  f2_name = Player.where(:id => f2)[0].name
  f3_name = Player.where(:id => f3)[0].name
  
  @position = "F"

  f1_nba_team =  Player.where(:id => f1)[0].nba_team
  f2_nba_team =  Player.where(:id => f2)[0].nba_team
  f3_nba_team =  Player.where(:id => f3)[0].nba_team
  
  f1_id = f1
  f2_id = f2
  f3_id = f3 

  three_player = Array.new([f1_name, @position, f1_nba_team, f1_oid, f1_id, f2_name, @position, f2_nba_team, f2_oid, f2_id, f3_name, @position, f3_nba_team, f3_oid, f3_id])
end 
end

def f_count
  self.player_ownerships.where(:position => "F").size
end

def g
 if self.g_count == 0
 elsif self.g_count == 1
    player = self.player_ownerships.where(:position => "G")[0].player_id
    @oid = self.player_ownerships.where(:position => "G")[0].id
   @name = Player.where(:id => player)[0].name
    @position = "G"
    @nba =  Player.where(:id => player)[0].nba_team
    @id = player
    player = Array.new([@name, @position, @nba_team, @oid, @id])
    
 elsif self.g_count == 2 
 players = self.player_ownerships.where(:position => "G")
 g1 = players[0].player_id
 g2 = players[1].player_id
 
 g1_oid = self.player_ownerships.where(:position => "G")[0].id
 g2_oid = self.player_ownerships.where(:position => "G")[1].id

 g1_name = Player.where(:id => g1)[0].name
 g2_name = Player.where(:id => g2)[0].name
 
 @position = "G"
  
 g1_nba_team =  Player.where(:id => g1)[0].nba_team
 g2_nba_team =  Player.where(:id => g2)[0].nba_team
 
 g1_id = g1
 g2_id = g2 
 
 two_player = Array.new([g1_name, @position, g1_nba_team, g1_oid, g1_id, g2_name, @position, g2_nba_team, g2_oid, g2_id]) 
 elsif self.g_count == 3 
  players = self.player_ownerships.where(:position => "G")
  g1 = players[0].player_id
  g2 = players[1].player_id
  g3 = players[2].player_id  

  g1_oid = self.player_ownerships.where(:position => "G")[0].id
  g2_oid = self.player_ownerships.where(:position => "G")[1].id
  g3_oid = self.player_ownerships.where(:position => "G")[2].id

  g1_name = Player.where(:id => g1)[0].name
  g2_name = Player.where(:id => g2)[0].name
  g3_name = Player.where(:id => g3)[0].name
  
  @position = "G"

  g1_nba_team =  Player.where(:id => g1)[0].nba_team
  g2_nba_team =  Player.where(:id => g2)[0].nba_team
  g3_nba_team =  Player.where(:id => g3)[0].nba_team
  
  g1_id = g1
  g2_id = g2
  g3_id = g3 

  three_player = Array.new([g1_name, @position, g1_nba_team, g1_oid, g1_id, g2_name, @position, g2_nba_team, g2_oid, g2_id, g3_name, @position, g3_nba_team, g3_oid, g3_id])
end 
end

def g_count
  self.player_ownerships.where(:position => "G").size
end
  
def score1
  now = Date.today
  id = self.player_ownerships[0].player_id
  created = self.player_ownerships[0].created_at.to_date
  @scorer1 = Player.where(:id => id)[0]['name']
  if Game.where(:player_name => @scorer1, :date => created..Date.today).empty?
    @score = 0
  else
  games = Game.where(:player_name => @scorer1, :date => created..Date.today)
  fgs = Array.new
  rebs = Array.new
  threepointers = Array.new
  games.each do |g|
        fgs.push g.fgs
        rebs.push g.rebs
        threepointers.push g.threepointers
        end
        fgpoints = fgs.sum * 2
        rebpoints = rebs.sum * 1.5
        threepointerpoints = threepointers.sum * 3
        @score = fgpoints + rebpoints + threepointerpoints
 end
end   

 
def score2
  now = Date.today
 id2 = self.player_ownerships[1].player_id
 created = self.player_ownerships[1].created_at.to_date
 @scorer2 = Player.where(:id => id2)[0]['name']
@games2 =  Game.where(:player_name => @scorer2, :date => created..Date.today)
if @games2.empty?
  @score = 0
else
  fgs = Array.new
  rebs = Array.new
  threepointers = Array.new
 @games2.each do |g|
        fgs.push g.fgs
        rebs.push g.rebs
        threepointers.push g.threepointers
        end
        fgpoints = fgs.sum * 2
        rebpoints = rebs.sum * 1.5
        threepointerpoints = threepointers.sum * 3
        @score = fgpoints + rebpoints + threepointerpoints
end
end

def score3
  now = Date.today
id3 = self.player_ownerships[2].player_id
created = self.player_ownerships[2].created_at.to_date
 @scorer3 = Player.where(:id => id3)[0]['name']
@games3 =  Game.where(:player_name => @scorer3,  :date => created..Date.today)
if @games3.empty?
  @score = 0
  else 
    fgs = Array.new
    rebs = Array.new
    threepointers = Array.new
 @games3.each do |g|
          fgs.push g.fgs
          rebs.push g.rebs
          threepointers.push g.threepointers
          end
          fgpoints = fgs.sum * 2
          rebpoints = rebs.sum * 1.5
          threepointerpoints = threepointers.sum * 3
          @score = fgpoints + rebpoints + threepointerpoints
end
end

def score4
  now = Date.today
id4 = self.player_ownerships[3].player_id
created = self.player_ownerships[3].created_at.to_date
 @scorer4 = Player.where(:id => id4)[0]['name']
@games4 =  Game.where(:player_name => @scorer4, :date => created..Date.today)
if @games4.empty?
  @score = 0
  else 
    fgs = Array.new
    rebs = Array.new
    threepointers = Array.new
 @games4.each do |g|
          fgs.push g.fgs
          rebs.push g.rebs
          threepointers.push g.threepointers
          end
          fgpoints = fgs.sum * 2
          rebpoints = rebs.sum * 1.5
          threepointerpoints = threepointers.sum * 3
          @score = fgpoints + rebpoints + threepointerpoints
end
end

def score5
  now = Date.today
id5 = self.player_ownerships[4].player_id
created = self.player_ownerships[4].created_at.to_date
 @scorer5 = Player.where(:id => id5)[0]['name']
@games5 =  Game.where(:player_name => @scorer5, :date => created..Date.today)
if @games5.empty?
  @score = 0
  else 
    fgs = Array.new
    rebs = Array.new
    threepointers = Array.new
 @games5.each do |g|
          fgs.push g.fgs
          rebs.push g.rebs
          threepointers.push g.threepointers
          end
          fgpoints = fgs.sum * 2
          rebpoints = rebs.sum * 1.5
          threepointerpoints = threepointers.sum * 3
          @score = fgpoints + rebpoints + threepointerpoints
end
end

def score6
  now = Date.today
id6 = self.player_ownerships[5].player_id
created = self.player_ownerships[5].created_at.to_date
 @scorer6 = Player.where(:id => id6)[0]['name']
@games6 =  Game.where(:player_name => @scorer6, :date => created..Date.today)
if @games6.empty?
  @score = 0
  else 
    fgs = Array.new
    rebs = Array.new
    threepointers = Array.new
 @games6.each do |g|
          fgs.push g.fgs
          rebs.push g.rebs
          threepointers.push g.threepointers
          end
          fgpoints = fgs.sum * 2
          rebpoints = rebs.sum * 1.5
          threepointerpoints = threepointers.sum * 3
          @score = fgpoints + rebpoints + threepointerpoints
end
end

def score7
  now = Date.today
id7 = self.player_ownerships[6].player_id
created = self.player_ownerships[6].created_at.to_date
 @scorer7 = Player.where(:id => id7)[0]['name']
@games7 =  Game.where(:player_name => @scorer7, :date => created..Date.today)
if @games7.empty?
  @score = 0
  else 
    fgs = Array.new
    rebs = Array.new
    threepointers = Array.new
 @games7.each do |g|
          fgs.push g.fgs
          rebs.push g.rebs
          threepointers.push g.threepointers
          end
          fgpoints = fgs.sum * 2
          rebpoints = rebs.sum * 1.5
          threepointerpoints = threepointers.sum * 3
          @score = fgpoints + rebpoints + threepointerpoints
end
end

def score8
  now = Date.today
id8 = self.player_ownerships[7].player_id
created = self.player_ownerships[7].created_at.to_date
 @scorer8 = Player.where(:id => id8)[0]['name']
@games8 =  Game.where(:player_name => @scorer8, :date => created..Date.today)
if @games8.empty?
  @score = 0
  else 
    fgs = Array.new
    rebs = Array.new
    threepointers = Array.new
 @games8.each do |g|
          fgs.push g.fgs
          rebs.push g.rebs
          threepointers.push g.threepointers
          end
          fgpoints = fgs.sum * 2
          rebpoints = rebs.sum * 1.5
          threepointerpoints = threepointers.sum * 3
          @score = fgpoints + rebpoints + threepointerpoints
end
end
def score_sum
  self.score1 + self.score2 + self.score3 + self.score4 + self.score5 + self.score6 + self.score7 + self.score8
end

end