class ContactMailer < ApplicationMailer
    require 'mailgun'

def send_contact_email(email_info)
    email = 'l.colcott@live.com'
    # @user = current_user.id
    @order = Order.last
    # @message = Order.last.charge_identifier
    date = Time.now.strftime("%B %d, %Y, %A")
    subject = "New user message #{date}"
    mail(to: 'l.colcott@live.com', subject: subject)    
end
end




# class MessageMailer < ApplicationMailer
#     require 'mailgun'
    
#       def contact(message)
#         mg_client = Mailgun::Client.new ENV['mailgun_secret_api_key']
#         message_params = {:from => message.email,
#                           :to => ENV['email'],
#                           :subject => 'Contact Form',
#                           :text => message.body}
#         mg_client.send_message ENV['mailgun_domain'], message_params
#     send