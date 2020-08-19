module Model
  class UserMailer < ApplicationMailer
    def welcome
      @user = params[:user]
      @url = 'http://localhost:3000'
      mail(to: @user.email, subject: 'Welcome to PTW')
    end
  end
end
