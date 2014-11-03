class SlideshowsController < ApplicationController
  layout "admin_layout"
  before_action :set_slideshow, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs, only: [:show, :edit, :index, :new]

  authorize_resource

  def index
    @slideshows = Slideshow.all
  end

  def show
  end

  def new
    @slideshow = Slideshow.new
  end

  def edit
  end

  def create
    @slideshow = Slideshow.new(slideshow_params)

    respond_to do |format|
      if @slideshow.save
        format.html { redirect_to @slideshow, notice: 'slideshow was successfully created.' }
        format.json { render :show, status: :created, location: @slideshow }
      else
        format.html { render :new }
        format.json { render json: @slideshow.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @slideshow.update(slideshow_params)
        format.html { redirect_to @slideshow, notice: 'slideshow was successfully updated.' }
        format.json { render :show, status: :ok, location: @slideshow }
      else
        format.html { render :edit }
        format.json { render json: @slideshow.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
    @slideshow.destroy
    respond_to do |format|
      format.html { redirect_to slideshows_url, notice: 'slideshow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_slideshow
      @slideshow = Slideshow.find(params[:id])
    end

    def slideshow_params
      params.require(:slideshow).permit(:background, :transition, :slotamount, :masterspeed, :delay, :order, :name)
    end

    def set_breadcrumbs
      @breadcrumbs = []
      @breadcrumbs << {name: "Slideshow", link: slideshows_path }      
    end
end
