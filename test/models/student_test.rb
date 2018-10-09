# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  address       :string
#  driving_hours :integer          default(0), not null
#  full_name     :string           not null
#  grade         :integer          default(0)
#  phone         :string
#  work          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_students_on_full_name  (full_name)
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
