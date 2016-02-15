# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  def notify_on_successful_order
    customer = User.create(first_name: "Johnny", last_name: "Britto")
    publisher = Publisher.create(name: "GoodPub")
    book1 = Book.create(title: "First book", price: 15, isbn: "1111111111", 
                        page_count: 100, description: "My first book",
                        publisher: publisher)
    book2 = Book.create(title: "Second book", price: 10, isbn: "2211111111", 
                        page_count: 100, description: "My second book",
                        publisher: publisher)
    
    order = Order.create
    order_item1 = order.order_items.create(book: book1, quantity: 2, price: book1.price)
    order_item2 = order.order_items.create(book: book2, quantity: 1, price: book2.price)

    OrderMailer.notify_on_successful_order(customer, order)
  end
end
