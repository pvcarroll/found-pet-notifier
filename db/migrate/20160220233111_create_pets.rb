class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :type
      t.string :breed
      t.string :color
      t.string :sex
      t.string :email

      t.timestamps null: false
    end
  end
end
