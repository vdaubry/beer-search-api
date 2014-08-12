# encoding: utf-8
namespace :data do
  desc "create fake datas"
  task :create => :environment do
    cities = ["Paris", "Brussels"]
    
    cities.each do |city|
      bars = []
      (1..1000).each do |n|
        attrs = {:name => Faker::Company.name, 
          :city => city, 
          :street => Faker::Address.street_name, 
          :street_number => rand(100), 
          :beers => [Faker::Lorem.words(2).join(' '), Faker::Lorem.words(2).join(' ')], 
          :longitude => Faker::Address.longitude, 
          :latitude => Faker::Address.latitude, 
          :rating => rand(50)/10.0}
        bars << Bar.new(attrs)
      end

      File.open("tmp/#{city}.json", "w") {|f| f.puts bars.to_json}
    end
  end
end