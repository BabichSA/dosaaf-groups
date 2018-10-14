# == Schema Information
#
# Table name: students
#
#  id            :integer          not null, primary key
#  address       :string
#  driving_hours :integer          default(0), not null
#  full_name     :string           not null
#  grade         :integer          default("not_set")
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

  def full_driving_hours
    driving_hours + drivings.count
  end

  def driving_group(groups = {})
    if groups.empty?
      groups = Student.driving_groups
    end

    if full_driving_hours > groups[:red]
      :red
    elsif full_driving_hours > groups[:yellow]
      :yellow
    else
      :green
    end
  end

  def driving_tags(groups = {})
    if groups.empty?
      groups = Student.driving_groups
    end

    tags = full_name
    tag_class = ''

    if full_driving_hours >= groups[:red]
      tags += ' красный много '
      tag_class = 'red_hours'
    elsif full_driving_hours >= groups[:yellow]
      tags += ' желтый средне '
      tag_class = 'yellow_hours'
    else
      tags += ' зеленый мало '
      tag_class = 'green_hours'
    end
    tags += full_driving_hours.to_s

    { "data-tokens": tags, "data-text": "#{full_name} (#{full_driving_hours})", "class": tag_class }
  end

  def self.driving_groups
    if Student.all.count > 0
      group_limit = self.count / 3
      yellow_hours_starts_with = self.all.sort_by {|student| student.full_driving_hours }.reverse[group_limit * 2].full_driving_hours
      red_hours_starts_with = self.all.sort_by {|student| student.full_driving_hours }.reverse[group_limit].full_driving_hours

      { green: 0, yellow: yellow_hours_starts_with, red: red_hours_starts_with }
    else
      { green: 0, yellow: 0, red: 0 }
    end
  end

  def self.full_names
    names = []
    self.all.each do |s|
      names.push [s.full_name, s.id] 
    end
    names
  end
end
