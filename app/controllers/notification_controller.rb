class NotificationController < ApplicationController
  def create
    flash[:notice] = "Successfully told your friend that they've changed."
    redirect_to root_url
  end
end
