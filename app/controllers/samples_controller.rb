class SamplesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :edit, :update]
  resource_controller
end