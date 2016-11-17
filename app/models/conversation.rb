class Conversation < Mailboxer::Conversation
  belongs_to :request
end

# == Schema Information
#
# Table name: mailboxer_conversations
#
#  id         :integer          not null, primary key
#  subject    :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  request_id :integer
#
