class Pet < ActiveRecord::Base
  # attr_accessor :animalType, :breed, :color, :sex, :email

  def find_pet
    client = SODA::Client.new({:domain => "data.austintexas.gov", :app_token => "9lzsGmTO9Jp03lNdi1Db7JvJ6"})
    typeString = "type = '#{self.animal_type}' AND (sex = '#{self.sex}' OR sex = 'Unknown')"
    response = client.get("kz4x-q9k5", {"$where" => typeString})
    matches = []
    response.each do |hashie|
      looks_like = hashie.looks_like.downcase
      color = hashie.color.downcase
      sex = hashie.sex.downcase

      if (looks_like.include? self.breed.downcase) &&
          (color.include? self.color.downcase) &&
          (sex.include? self.sex.downcase || sex == 'Unknown')
        puts "LOOKS LIKE #{self.breed} AND COLOR LIKE #{self.color}"
        # create match pet object
        matches.push({animal_type: self.animal_type, breed: looks_like, color: color, sex: sex, image: hashie.image.url})
      end
    end
    return matches
  end

  def find_matches
    @matches = self.find_pet
    if @matches.any?
      PetMailer.send_email(self, @matches).deliver_now
    end
    @matches
  end
end
