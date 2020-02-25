# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'localif3@gmail.com'
  layout 'mailer'
end
