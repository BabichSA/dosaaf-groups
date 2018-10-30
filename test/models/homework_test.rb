# == Schema Information
#
# Table name: homeworks
#
#  id          :integer          not null, primary key
#  assigned_at :date
#  available   :boolean          default(TRUE), not null
#  body        :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class HomeworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
