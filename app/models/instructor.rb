# == Schema Information
#
# Table name: instructors
#
#  id         :bigint(8)        not null, primary key
#  car        :string
#  car_number :string
#  full_name  :string           not null
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_instructors_on_full_name  (full_name)
#

class Instructor < ApplicationRecord
  has_many :drivings

  default_scope { order(full_name: :asc) }

  def self.full_names
    names = []
    self.all.each do |s|
      names.push [s.full_name, s.id] 
    end
    names
  end
end
