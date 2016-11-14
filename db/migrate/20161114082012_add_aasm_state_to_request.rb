class AddAasmStateToRequest < ActiveRecord::Migration[5.0]
  def change 
    add_column :requests, :aasm_state, :string, default: "request_made"
    add_index  :requests, :aasm_state
  end
end
