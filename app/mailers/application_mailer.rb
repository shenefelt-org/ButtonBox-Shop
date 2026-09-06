class ApplicationMailer < ActionMailer::Base
  default from: "Riley Orga <riley@buttonbox.cc>"
  default reply_to: "Riley Orga <riley@buttonbox.cc>"
  layout "mailer"
end
