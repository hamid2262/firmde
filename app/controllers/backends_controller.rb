class BackendsController < ApplicationController
  layout "admin_layout"
  before_action :authenticate_user!
  
  def index
  end
end
