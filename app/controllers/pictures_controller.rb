class PicturesController < ApplicationController
  layout "admin_layout" #, except: [:show, :index]
  before_action :set_page
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @pictures = @page.pictures.order(:category)
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = @page.pictures.new(picture_params)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to page_pictures_path, notice: 'picture was successfully created.' }

        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to page_pictures_path, notice: 'picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to page_pictures_path, notice: 'picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_picture
      @picture = @page.pictures.find(params[:id])
    end

    def set_page
      @page = Page.find(params[:page_id])
    end

    def picture_params
      params.require(:picture).permit(:img, :title, :category)
    end
end
