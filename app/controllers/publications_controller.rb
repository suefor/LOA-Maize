class PublicationsController < ApplicationController
  before_filter :authenticate
  resource_controller
end
