module PetHelper
  def find_matches pet
    puts 'PetHelper'
    @matches = @pet.find_pet
    if @matches.any?
      PetMailer.send_email(@pet, @matches).deliver_now
    end
  end
end
