class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://allthecatsdamnit.com/login'
    mail(to: user.email, subject: 'Welcome to 99 cat cat cat Catz')
  end
end
