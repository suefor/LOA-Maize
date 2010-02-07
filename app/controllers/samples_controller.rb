class SamplesController < ApplicationController
  resource_controller

  new_action.before do
    @site = Site.new
  end
end