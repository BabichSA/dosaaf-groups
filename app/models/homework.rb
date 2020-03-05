# == Schema Information
#
# Table name: homeworks
#
#  id          :bigint(8)        not null, primary key
#  assigned_at :date
#  available   :boolean          default(TRUE), not null
#  body        :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Homework < ApplicationRecord
end
