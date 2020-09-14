class ChangeProductionStatusOfOrderItems < ActiveRecord::Migration[5.2]
  def up
  	change_column_null :order_items, :production_status, false, 0
  	change_column :order_items, :production_status, :integer, default: 0
  end

  def down
  	change_column_null :order_items, :production_status, true, nil
  	change_column :order_items, :production_status, :integer, default: nil
  end
end
