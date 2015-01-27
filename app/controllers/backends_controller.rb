class BackendsController < ApplicationController
  layout "admin_layout"
  before_action :authenticate_user!
  skip_authorization_check

  def dashboard
    redirect_to root_path, error: "access denied" unless current_user.has_access?
  end

  def loesungen
    @loesungen = Page.find_by(title: "Lösungen")
    if @loesungen.nil?
      redirect_to new_page_path, alert: "first create Lösungen page"
    end
  end

  def services
    @services = Page.find_by(title: "Services")
    if @services.nil?
      redirect_to new_page_path, alert: "first create Services page"
    end
  end

  def db_backup
    # system "rake scrap --trace 2>&1 >> #{Rails.root}/log/rake.log &"
    system "PGPASSWORD='2010opcCS' pg_dump -F c -v -U deployer -h localhost opc_production -f /home/vr10123/apps/backups/#{DateTime.now.strftime('%Y-%m-%d-T-%H-%M')}.psq &"
    redirect_to root_path, notice: "/home/vr10123/apps/backups/#{DateTime.now.strftime('%Y-%m-%d-T-%H-%M')}-backup.psql has been generated "
  end
end