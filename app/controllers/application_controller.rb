class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery with: :exception
end
