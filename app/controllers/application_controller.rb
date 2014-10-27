class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_footer_blocks

  def set_footer_blocks
    @footer_left ||= Block.find_by(title: "footer-left")
  end
end
