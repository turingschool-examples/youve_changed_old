class NotificationsController < ApplicationController

  def create
    NotificationMailer.youve_changed_email(params[:email]).deliver_now
    redirect_to root_path
  end
end
