class ChangeColumnName2 < ActiveRecord::Migration
  def change
    rename_column :pets, :animal_typee, :animal_type
  end
end
