class AddRequestIdToMailboxer < ActiveRecord::Migration[5.0]
  def change
    add_column :mailboxer_conversations, :request_id, :integer
  end
end
