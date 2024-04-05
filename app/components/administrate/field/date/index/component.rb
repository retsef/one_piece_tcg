module Administrate::Field
  class Date::Index::Component < IndexComponent
    delegate :local_date, to: :helpers
  end
end
