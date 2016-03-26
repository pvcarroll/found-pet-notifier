class PetMailer < ApplicationMailer
  def send_email(pet)
    @pet = pet
    mail(to: @pet.email, subject: 'Found pet')
  end
end
