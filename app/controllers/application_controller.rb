# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  rescue_from ActiveRecord::RecordInvalid, :with => :default_model_validation_failure_response

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :set_locale
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = extract_locale_from_subdomain
  end

  # Get locale code from request subdomain (like http://it.application.local:3000)
  # You have to put something like:
  #   127.0.0.1 gr.application.local
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first || :en
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  end


  private

  def default_model_validation_failure_response(e)
    respond_to do |format|
      format.html {
        flash.now[:error] = "There was a problem creating the item."
        render :action => "new"
      }
      # Render out the validation failed message with a
      # 403 status code.
      format.js { render :text => e.message, :status => 403 }
    end
  end
end
