namespace :db do
  namespace :seed do    
    desc 'giving teams scores'
    task :team => :environment do
      t = Team.all
      t.each do |t|
      old = t.fantasy_points
      t.update_attributes(
           :fantasy_points => t.score_sum + old
           )
         end
                   
end
end
end

