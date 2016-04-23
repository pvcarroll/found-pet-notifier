class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :pets, :animalType, :animal_type
  end
end
