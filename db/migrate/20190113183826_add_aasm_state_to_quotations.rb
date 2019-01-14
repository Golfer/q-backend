class AddAasmStateToQuotations < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :aasm_state, :string
  end
end
