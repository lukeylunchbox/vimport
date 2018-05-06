class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_order_notification.subject
  #
  def new_order_notification(order)
    @order = order
    @greeting = "Hi"

    mail(to: @order.last.user.email, subject: 'Email')
  end
end
