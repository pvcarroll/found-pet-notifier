# Preview all emails at http://localhost:3000/rails/mailers/pet_mailer
class PetMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    PetMailer.send_email(Pet.first)
  end
end
