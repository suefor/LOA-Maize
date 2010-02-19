class SamplesController < ApplicationController
  before_filter :authenticate
  resource_controller

  new_action.before do
    object.site = Site.find(params[:site_id])
  end
end