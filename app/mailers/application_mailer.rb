# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: SendGrid::Email.new(email: ENV['SENDER_EMAIL'])
  layout 'mailer'
end
