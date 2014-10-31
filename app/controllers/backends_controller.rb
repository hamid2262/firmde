class BackendsController < ApplicationController
  layout "admin_layout"
  before_action :authenticate_user!
  skip_authorization_check

  def dashboard
    redirect_to root_path, error: "access denied" unless current_user.has_access?
  end

  def loesungen
    @loesungen = Page.find_by(title: "Lösungen")
  end
end
