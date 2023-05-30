class CreateItems < ActiveRecord::Migration[6.0]
  def change
     create_table :items do |t|
       t.string :item_name, null: false
       t.text :catch_copy, null: false
       t.references :user, null: false, foreign_key: true 
       t.integer  :category_id, null: false
       t.integer :condition_id, null: false
       t.integer :okuru_id, null: false
       t.integer :place_id, null: false
       t.integer :period_id, null: false
       t.integer :price, null: false
       t.timestamps
    end
  end
end
