class AddPhoneToPets < ActiveRecord::Migration
  def change
    add_column :pets, :phone, :string
  end
end
