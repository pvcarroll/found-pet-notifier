class Pet < ActiveRecord::Base
  # attr_accessor :animalType, :breed, :color, :sex, :email
  serialize :matches, Array

  def find_matches
    @matches = self.extract_matches_from_response
    if @matches.any? && !self.email.blank?
      PetMailer.send_email(self, @matches).deliver_now
    end
    @matches
  end

  def extract_matches_from_response
    puts 'SELF.MATCHHES: ', self.matches
    puts self.matches.class
    response = query_soda
    matches = []
    response.each do |hashie|
      looks_like = hashie.looks_like.downcase
      color = hashie.color.downcase
      sex = hashie.sex.downcase
      location = extract_location hashie

      if (looks_like.include? self.breed.downcase) &&
          (color.include? self.color.downcase) &&
          (sex.include? self.sex.downcase || sex == 'Unknown')
        puts "LOOKS LIKE #{self.breed} AND COLOR LIKE #{self.color}"
        # create a matching pet object
        matches.push({animal_type: self.animal_type, breed: looks_like, color: color, sex: sex,
                      found_location: location, image: hashie.image.url})


        # Add match to pet's list of matches, so each match is only reported once.
        self.matches.push(hashie.animal_id)
        puts 'SELF.MATCHES: ', self.matches


      end
    end
    return matches
  end

  def query_soda
    client = SODA::Client.new({:domain => "data.austintexas.gov", :app_token => "9lzsGmTO9Jp03lNdi1Db7JvJ6"})
    typeString = "type = '#{self.animal_type}' AND (sex = '#{self.sex}' OR sex = 'Unknown')"
    response = client.get("kz4x-q9k5", {"$where" => typeString})
    return response
  end

  def extract_location(hashie)
    # hashie.location.human_address is a string. eval converts it to a hash.
    location_hash = eval hashie.location.human_address
    return "#{location_hash[:address]}, #{location_hash[:city]}, #{location_hash[:zip]}"
  end
end
