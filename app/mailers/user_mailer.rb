# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def warn_user(_user)
    # set the ENV variables using the .env-template
    @user = _user
    from = SendGrid::Email.new(email: ENV['SENDER_EMAIL'])
    to = SendGrid::Email.new(email: ENV['RECEIVER_EMAIL'])
    subject = 'Notification about your body temperature'
    content = SendGrid::Content.new(type: 'text/html',
                                    value: ApplicationController.render(
                                      template: 'user_mailer/warn_user.html.erb', layout: nil
                                    ))
    mail = SendGrid::Mail.new(from, subject, to, content)
    send_grid = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = send_grid.client.mail._('send').post(request_body: mail.to_json)
  end
end
