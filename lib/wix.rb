require "wix/instance"
require "wix/version"

module Wix
  extend self

  def app_secret_key=(app_secret_key)
    @app_secret_key = app_secret_key
  end

  def app_secret_key
    return @app_secret_key if @app_secret_key
    "missing_app_secret_key"
  end

  def app_key=(app_key)
    @app_key = app_key
  end

  def app_key
    return @app_key if @app_key
    "missing_app_key"
  end
end