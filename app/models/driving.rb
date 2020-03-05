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

class Driving < ApplicationRecord
  belongs_to :student
  belongs_to :instructor

  by_star_field :start_date, offset: 3.hours
  by_star_field offset: 3.hours

  # default_scope { order("instructor_id ASC, start_date ASC") }

  def student_full_name; student.nil? ? '' : student.full_name end
  def instructor_full_name; instructor.nil? ? '' : instructor.full_name end
  def instructor_car; instructor.nil? ? '' : instructor.car end
  def instructor_car_number; instructor.nil? ? '' : instructor.car_number end

  def self.cards(date=nil, instructor_id=nil)
    if !(Driving.first.nil?)
      if date.nil?
        start_date = Time.zone.now.to_date
      else
        start_date = date.to_date
      end

      last_date = Driving.all.order("start_date asc").last.start_date.to_date + 1.day
      cards_list = []
      scope = Driving.between_times(start_date + 3.hours, last_date + 3.hours)

      if instructor_id.nil?
        instructors = scope.group(:instructor_id).pluck(:instructor_id)
      else
        instructors = [instructor_id]
      end

      instructors.each do |instructor|
        scope = Driving.where(instructor_id: instructor)

        start_date.upto(last_date) do |cur_date|
          day_scope = scope.by_day(cur_date, offset: 3.hours)
          puts day_scope.to_sql
          puts day_scope.count
          if day_scope.any?
            first = day_scope.first
            card = { 
              instructor: first.instructor_full_name,
              data: { 
                day_of_week: I18n.l(first.start_date, format: '%A'),
                start_date: I18n.l(first.start_date, format: '«%d» %B %Yг.'),
                car: first.instructor_car,
                car_number: first.instructor_car_number,
                student_8:  '_________________',
                student_10: '_________________',
                student_13: '_________________',
                student_15: '_________________'
              }
            }
            card[:data][:student_8] = scope.between_times(cur_date + 8.hours, cur_date + 8.hours).first.student_full_name if scope.between_times(cur_date + 8.hours, cur_date + 8.hours).any?
            card[:data][:student_10] = scope.between_times(cur_date + 10.hours, cur_date + 10.hours).first.student_full_name if scope.between_times(cur_date + 10.hours, cur_date + 10.hours).any?
            card[:data][:student_13] = scope.between_times(cur_date + 13.hours, cur_date + 13.hours).first.student_full_name if scope.between_times(cur_date + 13.hours, cur_date + 13.hours).any?
            card[:data][:student_15] = scope.between_times(cur_date + 15.hours, cur_date + 15.hours).first.student_full_name if scope.between_times(cur_date + 15.hours, cur_date + 15.hours).any?
            cards_list[cards_list.count] = card
          end
        end
      end
      cards_list
    else
      [ ]
    end
  end
end
