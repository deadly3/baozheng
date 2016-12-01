class AddNeedRedPointToMailboxer < ActiveRecord::Migration[5.0]
  def change
    add_column :mailboxer_conversations, :need_red_point, :boolean, :default => true
  end
end
