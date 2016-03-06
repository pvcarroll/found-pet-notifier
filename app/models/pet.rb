class Pet < ActiveRecord::Base
  def find_pet
    typeString = "type = #{self.animalType}"
    puts typeString
    if Rails.env.production?
      client = SODA::Client.new({:domain => "data.austintexas.gov", :app_token => "9lzsGmTO9Jp03lNdi1Db7JvJ6"})
      puts "client ", client.inspect
      typeString = "type = '#{self.animalType}' AND sex = '#{self.sex}'"
      puts typeString
      response = client.get("kz4x-q9k5", {"$where" => typeString})
      puts "response ", response.inspect
    else

    end
  end
end
