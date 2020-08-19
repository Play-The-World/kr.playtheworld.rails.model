module Model
  class ApplicationMailer < ActionMailer::Base
    default from: "no-reply@playthe.world"
    layout 'mailer'
  end
end

