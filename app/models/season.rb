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
  MAX_SUGGESTIONS_PER_USER = 10

  enum status: { upcoming: 0, ongoing: 1, ended: 2 }

  has_many :suggestions, dependent: :destroy
  has_many :users, -> { distinct }, through: :suggestions

  validates :name, :status, presence: true

  def to_s
    name
  end

  def pick_suggestion!
    picked_suggestion = suggestions.not_picked.order('RANDOM()').first
    picked_suggestion.update(picked_at: Time.zone.now)
  end
end
