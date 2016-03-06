class Pet < ActiveRecord::Base
  def find_pet
    if Rails.env.production?
      client = SODA::Client.new({:domain => "data.austintexas.gov", :app_token => "9lzsGmTO9Jp03lNdi1Db7JvJ6"})
      puts "client ", client.inspect
      response = client.get("kz4x-q9k5", {"$where" => "type = #{self.animalType}"})
      puts "response ", response.inspect
    else

    end
  end
end
