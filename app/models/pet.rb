class Pet < ActiveRecord::Base
  def find_pet
    puts "animalType #{self.animalType}"
    client = SODA::Client.new({:domain => "data.austintexas.gov", :app_token => "9lzsGmTO9Jp03lNdi1Db7JvJ6"})
    puts "client ", client.inspect

    # ENV['SSL_CERT_FILE'] = 'C:\Users\Paul\RubymineProjects\foundPetNotifier\config\cacert.pem'
    puts 'ENV', ENV['SSL_CERT_FILE']

    response = client.get("kz4x-q9k5", {"$where" => "type = 'dog'"})
    puts "response ", response.inspect
  end
end
