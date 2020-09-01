class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :freight
      t.integer :billed_amount
      t.integer :pay_method
      t.integer :status

      t.timestamps
    end
  end
end
