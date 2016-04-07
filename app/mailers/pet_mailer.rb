class PetMailer < ApplicationMailer
  def send_email(pet, matches)
    @pet = pet
    @matches = matches
    mail(to: @pet.email, subject: 'Found pet')
  end
end
