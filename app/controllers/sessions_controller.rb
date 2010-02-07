class SessionsController < Clearance::SessionsController
  def url_after_create
    new_sample_path
  end

  def url_after_destroy
    root_path
  end
end