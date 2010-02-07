class SitesController < ApplicationController
  resource_controller

  def create

    @site = Site.find_or_initialize_by_name(params[:site])
    @site.save!

    respond_to do |wants|
      wants.html
      wants.js {render :nothing => true}
    end
  end
end
