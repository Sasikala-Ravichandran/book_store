class ChangePriceToOrderItem < ActiveRecord::Migration
  def change
    change_column :order_items, :price, :decimal, precision: 8, scale: 2
  end
end
