class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :order,         null: false, foreign_key: true
      t.string     :post_code,      null: false
      t.integer    :place_id, null: false
      t.string     :city,          null: false
      t.string     :banti,         null: false
      t.string     :building_name
      t.string     :tel,  null: false

      t.timestamps
    end
  end
end
