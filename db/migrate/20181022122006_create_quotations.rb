class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.text :body
      t.string :title
      t.boolean :publicate, default: false
      t.datetime :publicated_date
      t.references :data_quotation, index: true
      t.references :author, index: true

      t.timestamps
    end
  end
end
