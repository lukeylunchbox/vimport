# class ModelMailer < ApplicationMailer
   
#   def new_order_notification(order)
#       email = 'l.colcott@live.com'
#       # @user = current_user.id
#       @order = Order.last
#       # @message = Order.last.charge_identifier
#       date = Time.now.strftime("%B %d, %Y, %A")
#       subject = "New user message #{date}"
#       mail(to: 'l.colcott@live.com', subject: subject)    
#   end
# end


# class ModelMailer < ActionMailer::Base

#   def new_order_notification(order)
#     # @user = user
#     mg_client = Mailgun::Client.new ENV['MAILGUN_API']
#     message_params = {:from    => ENV['MAILGUN_EMAIL'],
#                       :to      => 'l.colcott@live.com',
#                       :subject => 'Sample Mail using Mailgun API',
#                       :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
#     mg_client.send_message ENV['sandbox502fb4e8974d407883f338d872647189.mailgun.org'], message_params
#   end
# end

class ModelMailer < ApplicationMailer
  def new_order_notification(order)
    @order = Order.last
    @message = Order.last.charge_identifier
    mail(to: @order.user.email, subject: "Hi")
  end
end