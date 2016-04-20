desc "This task is called by the Heroku scheduler add-on"
task :check_pets => :environment do
  puts "Checking pets..."
  Pet.first.pet_task
  puts "done."
end
