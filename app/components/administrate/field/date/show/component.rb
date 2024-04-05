module Administrate::Field
  class Date::Show::Component < ShowComponent
    delegate :local_date, to: :helpers
  end
end
