desc "This task is called by the Heroku scheduler add-on"
task :check_pets => :environment do
  puts "Checking pets..."
  Pet.all.each do |pet|
    @pet = pet
    @pet.find_matches
  end
  puts "done."
end
