if Rails.env.development?
  ActiveRecordQueryTrace.enabled = Rails.root.join("tmp/query-trace-dev.txt").exist?
  # Optional: other gem config options go here
end
