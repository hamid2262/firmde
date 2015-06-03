class ViewStatisticsController < ApplicationController
  
  before_action :set_view_statistic, only: [:destroy]
  layout "admin_layout"
  authorize_resource

  # GET /view_statistics
  # GET /view_statistics.json
  def index
    @view_statistics = ViewStatistic.order(created_at: :desc)
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
      format.html { redirect_to view_statistics_url, notice: 'View statistic was successfully destroyed.' }
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
      params.require(:view_statistic).permit(:viewer_ip, :page, :section, :referer)
    end
end
