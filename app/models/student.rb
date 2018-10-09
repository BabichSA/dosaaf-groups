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

class Student < ApplicationRecord
  has_many :drivings
  
  default_scope { order(full_name: :asc) }

  enum grade: {
    not_set: 0,
    school9: 1,
    school11: 2,
    college: 3,
    baccalaureate: 4,
    university: 5,
    magistracy: 6
  }

  def self.full_names
    names = []
    self.all.each do |s|
      names.push [s.full_name, s.id] 
    end
    names
  end
end
