class CreateDataQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :data_quotations do |t|
      t.string :link_to_external_resource
      t.string :description
      t.integer :count_quotates

      t.timestamps
    end
  end
end
