class FriendMailer < ApplicationMailer
  def inform(user, friend_contact)
    @user = user
    attachments['scott.jpg'] = File.read("#{Rails.root}/public/scott.jpg")
    mail(to: friend_contact, subject: "#{user.name} says you've changed.")
  end
end
