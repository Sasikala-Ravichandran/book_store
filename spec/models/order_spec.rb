require 'rails_helper'

RSpec.describe Order, :type => :model do
  
  it { should belong_to(:user) }
  it { should have_many(:order_items) }

  it "returns the total order amount" do
    book1 = Fabricate(:book, price: 10)
    book2 = Fabricate(:book, price: 20)

    order = Fabricate(:order)

    order_item1 = Fabricate(:order_item, order: order, book: book1, price: book1.price, quantity: 2)
    order_item2 = Fabricate(:order_item, order: order, book: book2, price: book2.price,quantity: 1)
    expect(order.order_total).to eq(40)
  end
end