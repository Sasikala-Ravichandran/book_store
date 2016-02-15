class OrderMailer < ApplicationMailer

  def notify_on_successful_order(customer, order)
    @customer = customer
    @order = order

    mail to: @customer.email, subject: "Order Confirmation"
  end

  def send_password_reset_link(user)
    @user = user
    mail to: @user.email, subject: 'Reset Password'
  end

end
