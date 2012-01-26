#this works for importing to db from a csv
namespace :db do
  namespace :seed do
    require 'csv'
    
    desc 'Seed Quarterbacks'
    task :players => :environment do 
      uri = '/Users/Sam/Desktop/nbaplayersfix.csv'
        CSV.read(uri, :headers => true).each do |row|
          Player.create(
            :name => row[1],
            :position => row[2],
            :value => 100
            )
    end
  end
end
end