class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :pets, :type, :animalType
  end
end
