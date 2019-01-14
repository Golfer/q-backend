class AddAasmStateToJobRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :job_runs, :aasm_state, :string
  end
end
