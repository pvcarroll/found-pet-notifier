desc "This task is called by the Heroku scheduler add-on"
task :check_pets => :environment do
  puts "Checking pets..."
  Pet.all.each do |pet|
    @pet = pet
    @matches = @pet.find_pet
    if @matches.any?
      PetMailer.send_email(@pet, @matches).deliver_now
    end
    pet.pet_task
  end
  puts "done."
end
