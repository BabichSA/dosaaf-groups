class CreateGroupApps < ActiveRecord::Migration[5.2]
  def change
    create_table :group_apps do |t|
      t.string :name, null: false
      t.text :body
      t.boolean :available, null: false, default: true

      t.timestamps
    end

    add_index :group_apps, :name, unique: true
    add_index :group_apps, :available
  end
end
