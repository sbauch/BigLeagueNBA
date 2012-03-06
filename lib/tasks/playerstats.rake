#Import Stats from box score CSV
namespace :db do
  namespace :seed do
    require 'csv'
    desc 'season stats'
    task :stats => :environment do 
      uri = '/Users/Sam/Desktop/stats.csv'
          CSV.read(uri, :headers => true).each do |row|
            player = Player.find_or_initialize_by_name(row[1])
            player.update_attributes({
              :name => row[1],
              :nba_team => row[3],
              :fgs_sum => row[7],
              :threepointers_sum => row[10],
              :rebs_sum => row[18],
              :assists_sum => row[19],
              :blocks_sum => row[21],
              :steals_sum => row[20],
              :turnovers_sum => row[22]
              })
              
       end
  end
end
end

