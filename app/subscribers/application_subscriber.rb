class ApplicationSubscriber
  cattr_accessor :event

  def self.subscribe(to:)
    self.event = to
  end
end
