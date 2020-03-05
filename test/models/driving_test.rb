# == Schema Information
#
# Table name: drivings
#
#  id            :bigint(8)        not null, primary key
#  start_date    :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instructor_id :integer          not null
#  student_id    :integer          not null
#
# Indexes
#
#  index_drivings_on_instructor_id                                (instructor_id)
#  index_drivings_on_instructor_id_and_student_id_and_start_date  (instructor_id,student_id,start_date) UNIQUE
#  index_drivings_on_student_id                                   (student_id)
#

require 'test_helper'

class DrivingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
