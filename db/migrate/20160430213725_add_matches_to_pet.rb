class AddMatchesToPet < ActiveRecord::Migration
  def change
    add_column :pets, :matches, :string, array: true, default: []
  end
end
