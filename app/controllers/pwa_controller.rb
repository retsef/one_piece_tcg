class PWAController < ApplicationController
  layout false

  def manifest
    respond_to do |format|
      format.json
    end
  end

  def service_worker
    respond_to do |format|
      format.js
    end
  end
end
