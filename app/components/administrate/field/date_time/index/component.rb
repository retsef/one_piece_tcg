module Administrate::Field
  class DateTime::Index::Component < IndexComponent
    delegate :local_date, :local_time, to: :helpers
  end
end
