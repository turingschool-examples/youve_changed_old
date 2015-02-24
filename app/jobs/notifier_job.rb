class NotifierJob < ActiveJob::Base
  queue_as :default

  def perform(user, friend_email)
    FriendMailer.inform(current_user, params[:email]).deliver
  end
end
