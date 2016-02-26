require ::File.expand_path('../../config/environment',  __FILE__)
Rails.application.eager_load!

# require 'action_cable/process/logging'

ActionCable.server.config.allowed_request_origins = ["http://localhost:3003"]

run ActionCable.server
