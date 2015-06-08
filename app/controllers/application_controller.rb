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
            @view_statistic = ViewStatistic.new(view_statistic_params)

            ref = request.referer
            vs = @view_statistic
            is_crawler?(vs.viewer_ip)

            # if ref.nil? && ( is_crawler?(vs.viewer_ip) == false )
            #     vs.section = "{direct}"
            #     vs.save
            # els
            if ref && ref.include?("google")
                if ref.include?("aclk") || ref.include?("googleads")
                  vs.section = "{google adwords}" 
                else
                  vs.section = "{google normal search}" 
                end
                vs.save 
            end

        end
    end

  private

    def is_crawler?(request_ip)
      request_head = request.env["HTTP_USER_AGENT"]

      ips = all_crawlers.map{|c| c.ip} 
      heads = all_crawlers.map{|c| c.head}
      heads.delete nil
      ( ips.include?(request_ip) || heads.include?(request_head) ) ? true : false

    end

    def all_crawlers
      Rails.cache.fetch([:crawlers, :all], expires_in: 1.day) do 
        Crawler.all
      end  
    end

    def view_statistic_params
      location = request.location
      zip = location.data["aipcode"] if location and location.data

      {
        viewer_ip: request.ip,
        page:      request.original_url,
        referer:   request.referer,
        head:      request.env["HTTP_USER_AGENT"],
        city:      location.try(:city),
        country:   location.try(:country),
        zip:       zip
      }
    end
end