class CreateRequestRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :request_relationships do |t|
      t.integer :request_id
      t.integer :user_id

      t.timestamps
    end
  end
end
