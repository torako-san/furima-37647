class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string        :post_code, null:false
      t.integer       :delivery_area_id, null:false
      t.string        :ctiy, null:false
      t.string        :address_line, null:false
      t.string        :address_building, null:false
      t.string        :phone_number, null: false
      t.references    :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
