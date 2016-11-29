class AddIsCandidateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_candidate, :boolean, :default => false
  end
end
