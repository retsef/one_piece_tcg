Rails.configuration.after_initialize do
  Rails.application.config.tap do |config|
    config.active_storage.queues.analysis = :storage_analysis
    config.active_storage.queues.purge = :storage_purge
  end
end
