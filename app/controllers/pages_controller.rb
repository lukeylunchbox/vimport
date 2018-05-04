class PagesController < ApplicationController
  def home
     @proposals = Proposal.all
  end

  def contact
  end

  def about
  end
end
