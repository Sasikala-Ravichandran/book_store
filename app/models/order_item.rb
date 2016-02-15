class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :book

  validates :price, :quantity, presence: true

  def line_total
    quantity * price
  end
end
