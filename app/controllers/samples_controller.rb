class SamplesController < ApplicationController
  before_filter :authenticate
  resource_controller

  new_action.before do
    @site = Site.new
    @reference = Reference.new
  end
end