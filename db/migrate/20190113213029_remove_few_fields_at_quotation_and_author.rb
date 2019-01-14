class RemoveFewFieldsAtQuotationAndAuthor < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotations, :publicate
    remove_column :quotations, :publicated_date
    remove_column :authors, :publicated
  end
end
