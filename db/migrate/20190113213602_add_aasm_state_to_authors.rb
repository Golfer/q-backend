class AddAasmStateToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :aasm_state, :string
  end
end
