class CreateDrivings < ActiveRecord::Migration[5.2]
  def change
    create_table :drivings do |t|
      t.integer :instructor_id,  null: false
      t.integer :student_id,     null: false
      t.datetime :start_date,    null: false

      t.timestamps
    end
    add_index :drivings, :instructor_id
    add_index :drivings, :student_id
    add_index :drivings, [:instructor_id, :student_id, :start_date], unique: true
  end
end
