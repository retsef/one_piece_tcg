module Administrate::Field
  class Email::Index::Component < IndexComponent
    delegate :mail_to, to: :helpers
  end
end
