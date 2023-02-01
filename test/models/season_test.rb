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
require "test_helper"

class SeasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
