# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  before_picture :string
#  dream_picture  :string
#  user_id        :integer
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
