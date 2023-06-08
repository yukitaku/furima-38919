class CreateOrder2s < ActiveRecord::Migration[6.0]
  def change
    create_table :order2s do |t|

      t.timestamps
    end
  end
end
