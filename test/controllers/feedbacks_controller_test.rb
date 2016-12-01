# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  rating     :integer
#  commit     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  request_id :integer
#

require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
