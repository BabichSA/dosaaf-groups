class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :body
      t.date :assigned_at
      t.boolean :available, null: false, default: true

      t.timestamps
    end
  end
end
