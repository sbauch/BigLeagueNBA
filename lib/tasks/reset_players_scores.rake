namespace :db do
  namespace :seed do
    require 'csv'
    
    desc 'box scores'
    task :reset => :environment do 
      p = Game.all
      p.each do |p|
        p.update_attributes(
        :fgs => 0,
        :threepointers => 0,
        :rebs => 0,
        :assists => 0,
        :blocks => 0,
        :steals => 0,
        :turnovers => 0
        )
      end
    end
  end
end