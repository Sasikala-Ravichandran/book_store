class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :book

  def line_total
    quantity * price
  end
end
