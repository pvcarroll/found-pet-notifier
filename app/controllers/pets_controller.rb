class PetsController < ApplicationController
  def index
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @matches = @pet.find_matches
    if @pet.save
      render @pet
    elsif
      redirect_to index
    end
  end

  private

    def pet_params
      params.require(:pet).permit(:animal_type, :breed, :color, :sex, :email)
    end
end
