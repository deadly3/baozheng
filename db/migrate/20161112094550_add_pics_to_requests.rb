class AddPicsToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :BeforePicture, :string
    add_column :requests, :DreamPicture, :string
  end
end
