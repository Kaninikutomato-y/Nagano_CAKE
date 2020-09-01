class AddColumnToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :last_name, :string
    add_column :clients, :first_name, :string
    add_column :clients, :last_name_kana, :string
    add_column :clients, :first_name_kana, :string
    add_column :clients, :postcode, :string
    add_column :clients, :address, :string
    add_column :clients, :phone_number, :string
    add_column :clients, :is_deleted, :boolean, default: false, null: false
  end
end
