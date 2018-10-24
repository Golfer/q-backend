class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :link_to_wikipedia
      t.string :short_description
      t.text :full_description
      t.date :birthday
      t.date :date_of_death
      t.string :pseudonym
      t.boolean :publicated, default: true

      t.timestamps
    end
  end
end
