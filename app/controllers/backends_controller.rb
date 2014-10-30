class BackendsController < ApplicationController
  layout "admin_layout"
  before_action :authenticate_user!
  skip_authorization_check

  def index
    redirect_to root_path, error: "access denied" unless current_user.has_access?
  end
end
