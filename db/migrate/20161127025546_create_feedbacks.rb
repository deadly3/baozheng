class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :rating
      t.string :commit

      t.timestamps
    end
  end
end
