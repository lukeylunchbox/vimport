class ModelMailer < ApplicationMailer
  def new_order_notification(order)
    @order = Order.last
    @message = Order.last.charge_identifier
    mail(to: @order.user.email, subject: "Hi")
  end
end

