class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :full_name,  null: false
      t.string :phone

      t.timestamps
    end
    add_index :instructors, :full_name
  end
end
