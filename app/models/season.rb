# == Schema Information
#
# Table name: seasons
#
#  id         :uuid             not null, primary key
#  name       :string
#  status     :integer          default("upcoming")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Season < ApplicationRecord
  enum status: { upcoming: 0, ongoing: 1, ended: 2 }
end
