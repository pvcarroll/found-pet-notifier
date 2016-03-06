class Pet < ActiveRecord::Base
  def find_pet
    if Rails.env.production?
      client = SODA::Client.new({:domain => "data.austintexas.gov", :app_token => "9lzsGmTO9Jp03lNdi1Db7JvJ6"})
      puts "client ", client.inspect
      typeString = "type = '#{self.animalType}' AND (sex = '#{self.sex}' OR sex = 'unknown')"
      puts typeString
      response = client.get("kz4x-q9k5", {"$where" => typeString})
      # puts "response ", response.inspect
      response.each do |hashie|
        puts "HASHIE: "
        puts hashie.looks_like
        puts self.breed
        looks_like = hashie.looks_like.downcase
        if looks_like.include? self.breed
          puts "looks like #{self.breed}"
        end
      end
    else

    end
  end
end
