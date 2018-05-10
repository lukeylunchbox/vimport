    class ContactMailer < ApplicationMailer
   
        def send_contact_email(user_info)
            email = ENV.fetch('MAILGUN_EMAIL')
            @user = user_info[:user]
            params = user_info[:params]
            @name = params[:name]
            @message = params[:message]
            @user_email = params[:user_email]
            date = Time.now.strftime("%B %d, %Y, %A")
            subject = "New user message #{date}"
            mail(to: email, subject: subject)    
        end
    end


