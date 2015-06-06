class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
 
  after_action   :user_activity
  before_action  :viewer_activity
  before_action  :initialize_contact
  before_action  :set_locale

  def default_url_options(options = {})
    {locale: I18n.locale}
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

    def viewer_activity
      if current_user.nil?
        @view_statistic = ViewStatistic.new
        @view_statistic.viewer_ip = request.ip
        @view_statistic.page = request.original_url
      
        location = request.location
        @view_statistic.city    = location.city 
        @view_statistic.country = location.country 
        @view_statistic.zip     = location.data["zipcode"]

        referer = request.referer
        @view_statistic.referer = referer
        
        if referer.nil? or referer.include?("google")
          view_statistic = @view_statistic
          if referer.nil?
            view_statistic.section = "{direct}" 

          elsif referer.include?("aclk")
            view_statistic.section = "{google adwords}" 

          else
            view_statistic.section = "{google normal search}" 

          end
          view_statistic.save 
        end

      end
    end

end
