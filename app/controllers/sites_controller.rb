class SitesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]
  resource_controller

  index.wants.json { render :json => Site.all.to_json }
  
  edit.before do
    @sample = Sample.new(:site_id => @site.id)
  end
end
