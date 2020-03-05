class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :full_name,      null: false
      t.string :phone
      t.string :address
      t.string :work
      t.integer :grade,         default: 0
      t.integer :driving_hours, default: 0, null: false
      t.timestamps
    end
    add_index :students, :full_name
  end
end
