class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
 
  after_action  :user_activity
  before_action  :initialize_contact
  before_action  :set_locale

  def default_url_options(options = {})
    {locale: I18n.locale, host: "aa.localhost:3000/aa/"}
  end
    
  private
    def set_locale

      I18n.locale = params[:locale] || I18n.default_locale

      # I18n.locale = params[:locale] if params[:locale].present?
      # current_user.locale
      # request.subdomain
      # request.env["HTTP_ACCEPT_LANGUAGE"]
      # request.remote_ip
    end
    
    def user_activity
      current_user.try :touch
    end

    def initialize_contact
      @contact = Contact.new      
    end

end
