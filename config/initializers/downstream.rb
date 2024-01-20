Downstream.configure do |config|
  config.pubsub = :stateless # it's a default adapter
  config.async_queue = :downstream # nil by default
end

Rails.application.config.after_initialize do
  # To make sure event store is initialized use load hook
  # `store` == `Downstream`
  ActiveSupport.on_load "downstream-events" do |store|
    # store.subscribe Order::CreateEvent, to: Order::Load
  end
end

