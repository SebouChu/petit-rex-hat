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
require "test_helper"

class SeasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
