class CreateUrlAnchors < ActiveRecord::Migration
  def change
    create_table :url_anchors do |t|
      t.references :url_list, index: true, foreign_key: true
      t.string :data
      t.timestamps null: false
    end
  end
end
