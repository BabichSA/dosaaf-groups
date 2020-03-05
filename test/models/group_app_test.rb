# == Schema Information
#
# Table name: group_apps
#
#  id         :bigint(8)        not null, primary key
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

require 'test_helper'

class GroupAppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
