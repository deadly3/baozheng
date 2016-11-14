class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer  :user_id
      t.string   :title
      t.text     :description
      t.string   :before_picture
      t.string   :dream_picture
      t.timestamps
    end
  end
end
