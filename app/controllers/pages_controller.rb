class PagesController < ApplicationController
  def home
     @proposals = Proposal.all
  end

  def contact
  end

  def about
  end

  def contact_email
    user_info = {user: current_user, params: email_params}
    ContactMailer.send_contact_email(user_info).deliver_now
    render :contact
  end

  private
  def email_params
    params.require(:contact).permit(:name, :message)
  end
end
