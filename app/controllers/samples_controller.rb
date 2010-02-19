class SamplesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]
  resource_controller

  new_action.before do
    object.site = Site.find(params[:site_id])
  end
end