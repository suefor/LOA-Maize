class SitesController < ApplicationController
  before_filter :authenticate
  resource_controller

  edit.before do
    @sample = Sample.new(:site_id => @site.id)
  end
end
