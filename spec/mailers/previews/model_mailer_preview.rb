# Preview all emails at http://localhost:3000/rails/mailers/model_mailer
class ModelMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/model_mailer/new_order_notification
  def new_order_notification
    ModelMailerMailer.new_order_notification
  end

end
