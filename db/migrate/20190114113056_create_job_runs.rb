class CreateJobRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :job_runs do |t|
      t.string :name
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
  end
end
