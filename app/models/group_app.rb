# == Schema Information
#
# Table name: group_apps
#
#  id         :integer          not null, primary key
#  available  :boolean          default(TRUE), not null
#  body       :text
#  fa_icon    :string
#  group_link :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_group_apps_on_available  (available)
#  index_group_apps_on_name       (name) UNIQUE
#

class GroupApp < ApplicationRecord
  default_scope { order(created_at: :asc) }
end
