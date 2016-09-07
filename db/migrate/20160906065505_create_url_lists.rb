class CreateUrlLists < ActiveRecord::Migration
  def change
    create_table :url_lists do |t|
      t.string :url
      t.string :description
      t.timestamps null: false
    end
  end
end
