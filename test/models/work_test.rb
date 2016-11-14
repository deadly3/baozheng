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
#  is_hidden   :boolean          default(TRUE)
#

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
