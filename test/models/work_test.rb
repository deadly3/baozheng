# == Schema Information
#
# Table name: works
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :integer
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
