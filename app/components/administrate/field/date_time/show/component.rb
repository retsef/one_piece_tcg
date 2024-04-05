module Administrate::Field
  class DateTime::Show::Component < ShowComponent
    delegate :local_date, :local_time, to: :helpers
  end
end
