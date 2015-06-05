require 'csv'
class ViewStatisticsController < ApplicationController
  
  before_action :set_view_statistic, only: [:destroy, :find_geocode]
  layout "admin_layout"
  authorize_resource

  # GET /view_statistics
  # GET /view_statistics.json
  def index
    if params[:viewer_ip]
      @view_statistics = ViewStatistic.where("viewer_ip LIKE ?", "%#{params[:viewer_ip]}%").order(created_at: :desc)
      @viewer_ip = params[:viewer_ip]
    else
      session[:back_link] = request.original_url

      @day = params[:commit] ? params[:commit].to_date : Date.today

      @view_statistics = ViewStatistic.where("created_at>? and created_at<?", (@day), (@day + 1.day))

      if    params[:google] == "google all"
        @view_statistics = @view_statistics.where("referer LIKE ?", "%google%")
        @google = "google all"

      elsif params[:google] == "google normal"
        @view_statistics = @view_statistics.where("referer LIKE ? and referer NOT LIKE ?", "%google%", "%aclk%")
        @google = "google normal"

      elsif params[:google] == "google ad"
        @view_statistics = @view_statistics.where("referer LIKE ?", "%aclk%")
        @google = "google ad"

      elsif params[:google] == "all"
        @google = "all"
      end
      @view_statistics = @view_statistics.order(created_at: :desc)



      @view_statistics1 = ViewStatistic.where("created_at>? and created_at<?", (@day), (@day + 1.day))
      @all = @view_statistics1.size

      @view_statistics1 = @view_statistics1.where("referer LIKE ?", "%google%")
      @google_all = @view_statistics1.size

      @view_statistics1 = @view_statistics1.where("referer NOT LIKE ?", "%aclk%")
      @google_normals = @view_statistics1.size

      @google_ads = @google_all - @google_normals
    end

    respond_to do |format|
      format.html
      format.csv { send_data @view_statistics.to_csv }
      # format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end

  end

  def find_geocode
    
    geocode = Geocoder.search(@view_statistic.viewer_ip)
    # geocode = Geocoder.search("109.75.95.20")
    if geocode.last
      city = geocode.last.city
      country = geocode.last.country
      zip = geocode.last.data["zip_code"]

      @view_statistics = ViewStatistic.where(viewer_ip: @view_statistic.viewer_ip)
      @view_statistics = @view_statistics.update_all(city: city, country: country, zip: zip)

    end
    redirect_to :back
  end

  def create
    @view_statistic = ViewStatistic.new(view_statistic_params)

    respond_to do |format|
      if @view_statistic.save
        # format.html { redirect_to @view_statistic, notice: 'View statistic was successfully created.' }
        # format.json { render :show, status: :created, location: @view_statistic }
        format.js { render inline: "danke" }
      else
        format.html { render :new }
        format.json { render json: @view_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @view_statistic.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'View statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_view_statistic
      @view_statistic = ViewStatistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def view_statistic_params
      params.require(:view_statistic).permit(:viewer_ip, :page, :section, :referer, :country, :city, :zip)
    end
end
