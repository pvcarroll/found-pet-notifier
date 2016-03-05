class PetsController < ApplicationController
  def index
    @pet = Pet.new
  end

  def create
    puts pet_params
    @pet = Pet.new(pet_params)
    # @pet.save
    if Rails.env.production?
      @pet.find_pet
    end

  end

  private

    def pet_params
      params.require(:pet).permit(:animalType, :breed, :color, :sex, :email)
    end
end
