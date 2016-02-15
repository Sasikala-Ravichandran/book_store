class OrdersController < ApplicationController

  before_action :require_login
  before_action :set_cart

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build
    transfer_the_cart_item

    if @order.valid?
      total_sale = @cart.total_sale_in_cents

      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      token = params[:stripeToken]
      #require 'pry'; binding.pry
      begin
        charge = Stripe::Charge.create(
          amount: total_sale,
          currency: "usd",
          source: token
          )

        @order.save
        @cart.destroy
        session[:cart_id] = nil

        OrderMailer.notify_on_successful_order(current_user, @order).deliver_now
        flash[:success] = "Order has been created"

      rescue Stripe::CardError => e
        flash[:danger] = "Order has not been created\n" + e.message
      end
    end
    redirect_to root_path
  end

  private
  def transfer_the_cart_item
    @cart.cart_items.each do |item|
      @order.order_items << OrderItem.new(
        book_id: item.book_id,
        order_id: @order.id,
        price: item.price,
        quantity: item.quantity
      )
    end
  end
end

