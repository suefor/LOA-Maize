class SamplesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]
  resource_controller
end