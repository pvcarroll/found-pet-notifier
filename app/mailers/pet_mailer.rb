class PetMailer < ApplicationMailer
  def send_email(pet, match)
    @pet = pet
    @match = match
    mail(to: @pet.email, subject: 'Found pet')
  end
end
