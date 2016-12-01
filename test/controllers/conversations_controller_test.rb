# == Schema Information
#
# Table name: mailboxer_conversations
#
#  id             :integer          not null, primary key
#  subject        :string           default("")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  request_id     :integer
#  need_red_point :boolean          default(TRUE)
#

require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
