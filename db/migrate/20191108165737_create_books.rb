class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :genre
      t.string :author
      t.string :pub_date
      t.timestamps
    end
  end
end
