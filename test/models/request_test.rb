# == Schema Information
#
# Table name: requests
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  title          :string
#  description    :text
#  before_picture :string
#  dream_picture  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
