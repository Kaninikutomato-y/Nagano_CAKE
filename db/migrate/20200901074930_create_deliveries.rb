class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.string :postcode
      t.integer :client_id
      t.text :address

      t.timestamps
    end
  end
end
