class ThanksMailer < ApplicationMailer
  default from: 'no-replay@gmail.com'

  def complete_mail(user)
    @user = user
    @url = "https://0c09316d1da94d56aaa5582de0862fb2.vfs.cloud9.us-east-1.amazonaws.com/users/#{@user.id}"
    mail(subject: "COMPLETE join your address" ,to: @user.email)
  end
end
