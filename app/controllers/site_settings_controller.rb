class SiteSettingsController < ApplicationController
  layout "admin_layout"
  before_action :set_site_setting, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @site_settings = SiteSetting.all
  end

  def show
  end

  def new
    @site_setting = SiteSetting.new
  end

  def edit
  end

  def create
    @site_setting = SiteSetting.new(site_setting_params)
    respond_to do |format|
      if @site_setting.save
        format.html { redirect_to @site_setting, notice: 'site_setting was successfully created.' }
        format.json { render :show, status: :created, location: @site_setting }
      else
        format.html { render :new }
        format.json { render json: @site_setting.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @site_setting.update(site_setting_params)
    respond_to do |format|
      if @site_setting.update(site_setting_params)
        format.html { redirect_to @site_setting, notice: 'site_setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_setting }
      else
        format.html { render :edit }
        format.json { render json: @site_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @site_setting.destroy
    respond_to do |format|
      format.html { redirect_to site_settings_url, notice: 'site_setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_site_setting
      @site_setting = SiteSetting.find(params[:id])
    end

    def site_setting_params
      params.require(:site_setting).permit(:site_name, :logo, :favicon, :contact_form_text)
    end
end
