class AddWinnerToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :winner, :integer, default: ""
  end
end
     
