class ChangeFreightOfOrders < ActiveRecord::Migration[5.2]
  def up
  	change_column :orders, :freight, :integer, default: 800
  end

  def down
  	change_column :orders, :freight, :integer
  end
end
