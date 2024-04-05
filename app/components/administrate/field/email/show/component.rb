module Administrate::Field
  class Email::Show::Component < ShowComponent
    delegate :mail_to, to: :helpers
  end
end
