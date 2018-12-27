class CreateQuotationsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations_tags do |t|
      t.references :quotation, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
