class Pet < ActiveRecord::Base
  attr_accessor :animalType, :breed, :color, :sex, :email

  def find_pet
    client = SODA::Client.new({:domain => "data.austintexas.gov", :app_token => "9lzsGmTO9Jp03lNdi1Db7JvJ6"})
    puts "CLIENT ", client.inspect
    typeString = "type = '#{self.animalType}' AND (sex = '#{self.sex}' OR sex = 'Unknown')"
    puts typeString
    response = client.get("kz4x-q9k5", {"$where" => typeString})
    puts "RESPONSE ", response.inspect
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
        matches.push({animalType: self.animalType, breed: looks_like, color: color, sex: sex, image: hashie.image.url})
      end
    end
    return matches
  end
end
