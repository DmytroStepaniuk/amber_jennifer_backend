require "jasper_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"

  def errors_of(resource)
    resource_errors = {} of String => Array(String)

    resource.errors.each do |error|
      resource_errors[error.attr.to_s] ||= [] of String
      resource_errors[error.attr.to_s].push error.message.to_s
    end

    logger.info resource_errors

    {
      errors: resource_errors,
    }
  end
end
