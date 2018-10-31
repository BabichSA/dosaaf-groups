class AddCarToInstructor < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :car, :string
    add_column :instructors, :car_number, :string
  end
end
