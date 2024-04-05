module Administrate::Field
  class Time::Show::Component < ShowComponent
    delegate :local_time, to: :helpers
  end
end
