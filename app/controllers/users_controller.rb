class UsersController < Clearance::UsersController
  #before_filter :authenticate, :only => :new
end