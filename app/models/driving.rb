# == Schema Information
#
# Table name: drivings
#
#  id            :integer          not null, primary key
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

class Driving < ApplicationRecord
  belongs_to :student
  belongs_to :instructor

  def student_full_name; student.nil? ? '' : student.full_name end
  def instructor_full_name; instructor.nil? ? '' : instructor.full_name end
end
