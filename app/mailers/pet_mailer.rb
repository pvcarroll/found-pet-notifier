class PetMailer < ApplicationMailer
  def send_email(pet)
    @pet = pet
    mail(to: 'pvcarroll@gmail.com', subject: 'Found pet')
  end
end
