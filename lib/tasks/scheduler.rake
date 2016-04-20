desc "This task is called by the Heroku scheduler add-on"
task :check_pets => :environment do
  puts "Checking pets..."
  Pet.all.each do |pet|
    puts pet.inspect
    pet.pet_task
  end
  puts "done."
end
