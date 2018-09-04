class AddGroupLinkToGroupApps < ActiveRecord::Migration[5.2]
  def change
    add_column :group_apps, :group_link, :string
  end
end
