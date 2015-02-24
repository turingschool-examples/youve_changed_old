class NotificationController < ApplicationController
  def create
    FriendMailer.inform(current_user, params[:email]).deliver_later
    flash[:notice] = "Successfully told your friend that they've changed."
    redirect_to root_url
  end
end
