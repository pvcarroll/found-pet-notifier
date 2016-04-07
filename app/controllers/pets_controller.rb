class PetsController < ApplicationController
  def index
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    # @pet.save
    matches = @pet.find_pet
    if matches.any?
      PetMailer.send_email(@pet, matches).deliver_now
    end
  end

  private

    def pet_params
      params.require(:pet).permit(:animalType, :breed, :color, :sex, :email)
    end
end
