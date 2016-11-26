class AddRatingCommitToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rating, :integer
    add_column :users, :commit, :string
  end
end
