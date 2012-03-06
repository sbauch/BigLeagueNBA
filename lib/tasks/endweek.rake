namespace :db do
  namespace :seed do    
    desc 'giving teams wins losses'
    task :wins => :environment do
      leagues = Array.new
      lid = League.all
      lid.each do |l|
              lg = LeagueMembership.where(:league_id => l)
                          teams = Array.new
                  
                          lg.each do |t|
                          teams.push t.team_id
                                    end 
               
      fullteams = Team.where(:id => teams).where('fantasy_points != 0').order("fantasy_points DESC")
      fullteams.each do |t|
        losses_old = t.losses
        wins_old = t.wins
        fantasy_points_old = t.fantasy_points_total
        t.update_attributes(
        :wins => (fullteams.count - (fullteams.index(t) + 1)) + wins_old,
        :losses => fullteams.index(t) + losses_old,
        :fantasy_points_total => t.fantasy_points + fantasy_points_old,
        :fantasy_points => 0
        )
      end
                    
end
end
end
end


