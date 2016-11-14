class AddPersonalDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname,    :string,  default: ""
    add_column :users, :description, :text
    add_column :users, :avatar,      :string
  end
end
