# == Schema Information
#
# Table name: seasons
#
#  id         :uuid             not null, primary key
#  god_mode   :boolean          default(FALSE)
#  name       :string
#  status     :integer          default("upcoming")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Season < ApplicationRecord
  MAX_SUGGESTIONS_PER_USER = 10

  enum status: { ongoing: 1, upcoming: 10, ended: 20 }

  has_many :suggestions, dependent: :destroy
  has_many :users, -> { distinct }, through: :suggestions

  validates :name, :status, presence: true

  scope :ordered, -> { order(status: :asc, created_at: :desc) }

  def self.current
    ongoing.first
  end

  def to_s
    name
  end

  def pick_suggestion!
    picked_suggestion = suggestions.not_picked.order('RANDOM()').first
    picked_suggestion.update(picked_at: Time.zone.now) if picked_suggestion.present?
  end
end
