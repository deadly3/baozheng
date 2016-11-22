class AddAgeDistrictSexToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :district, :string
    add_column :users, :sex, :string
  end
end
