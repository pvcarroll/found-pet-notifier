class PetsController < ApplicationController
  def index
    @pet = Pet.new
  end

  def create
    puts pet_params
  end

  private

    def pet_params
      params.require(:pet).permit(:type, :breed, :color, :sex, :email)
    end
end
