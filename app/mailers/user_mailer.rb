# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def warn_user(user)
    @user = user
    mail(to: 'test@abc.com', subject: 'Your health is in danger! your body temperature is contiously high!')
  end
end
