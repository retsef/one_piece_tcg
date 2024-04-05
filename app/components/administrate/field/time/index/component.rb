module Administrate::Field
  class Time::Index::Component < IndexComponent
    delegate :local_time, to: :helpers
  end
end
