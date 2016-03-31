class Pet < ActiveRecord::Base

  def find_pet
    # if Rails.env.production?
      print "SELF: ", self.inspect
      puts
      client = SODA::Client.new({:domain => "data.austintexas.gov", :app_token => "9lzsGmTO9Jp03lNdi1Db7JvJ6"})
      puts "CLIENT ", client.inspect
      typeString = "type = '#{self.animalType}' AND (sex = '#{self.sex}' OR sex = 'Unknown')"
      puts typeString
      response = client.get("kz4x-q9k5", {"$where" => typeString})
      puts "RESPONSE ", response.inspect
      response.each do |hashie|
        looks_like = hashie.looks_like.downcase
        color = hashie.color.downcase
        sex = hashie.sex.downcase

        if (looks_like.include? self.breed.downcase) &&
            (color.include? self.color.downcase) &&
            (sex.include? self.sex.downcase || sex == 'Unknown')
          puts "LOOKS LIKE #{self.breed} AND COLOR LIKE #{self.color}"
          return true
          # Mail self.email
        else
          return false
        end
      end
    # else
    #   # DEVELOPMENT ENVIRONMENT
    #   puts self.email
    #   return true
    # end
  end
end
