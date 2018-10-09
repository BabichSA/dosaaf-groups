# == Schema Information
#
# Table name: instructors
#
#  id         :integer          not null, primary key
#  full_name  :string           not null
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_instructors_on_full_name  (full_name)
#

require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
