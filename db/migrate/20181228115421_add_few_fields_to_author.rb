class AddFewFieldsToAuthor < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :img_link, :string
    add_column :authors, :link_at_origin_resource, :string
  end
end
