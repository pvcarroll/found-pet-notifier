class PetController < ApplicationController
  def index
    puts "INDEX"
    @pet = Pet.new
  end

  def create
    puts params
  end

  def update
  end

  def show
  end
end
