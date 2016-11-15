# == Schema Information
#
# Table name: request_relationships
#
#  id         :integer          not null, primary key
#  request_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RequestRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
