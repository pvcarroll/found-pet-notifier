desc "This task is called by the Heroku scheduler add-on"
task :check_pets => :environment do
  puts "Checking pets..."
  Pet.first.pet_task
  puts "done."
end

task :send_reminders => :environment do
  User.send_reminders
end