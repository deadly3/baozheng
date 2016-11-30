class AddRequestIdToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :request_id, :integer
  end
end
