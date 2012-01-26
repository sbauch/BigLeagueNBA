#Import Stats from box score CSV
namespace :db do
  namespace :seed do
    require 'csv'
    desc 'box scores and team fp'
    task :games => :environment do 
      uri = '/Users/Sam/Desktop/games125.csv'
          CSV.read(uri, :headers => true).each do |row|
          Game.create(
            :player_name => row[0],
            :fgs => row[2],
            :threepointers => row[5],
            :rebs => row[13],
            :assists => row[14],
            :blocks => row[16],
            :steals => row[15],
            :turnovers => row[17],
            :date => Date.today - 1
            )
    end
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