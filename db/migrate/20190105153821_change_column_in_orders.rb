class ChangeColumnInOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_status_id, :bigint
    add_column :orders, :order_status, :string
  end
end
