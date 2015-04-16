class KundensController < ApplicationController
  layout "admin_layout", except: [:show]
  before_action :set_kunden, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @kundens = Kunden.order(:name)
  end

  def show
  end

  def new
    @kunden = Kunden.new
  end

  def edit
  end

  def create
    @kunden = Kunden.new(kunden_params)
    respond_to do |format|
      if @kunden.save
        format.html { redirect_to @kunden, notice: 'kunden was successfully created.' }
        format.json { render :show, status: :created, location: @kunden }
      else
        format.html { render :new }
        format.json { render json: @kunden.errors, status: :unprocessable_entity }
      end
    end    
  end

  def update
    respond_to do |format|
      if @kunden.update(kunden_params)
        format.html { redirect_to @kunden, notice: 'kunden was successfully updated.' }
        format.json { render :show, status: :ok, location: @kunden }
      else
        format.html { render :edit }
        format.json { render json: @kunden.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
    @kunden.destroy
    respond_to do |format|
      format.html { redirect_to kundens_url, notice: 'kunden was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_kunden
      @kunden = Kunden.find(params[:id])
    end

    def kunden_params
      params.require(:kunden).permit(:name, :url, :photo, :photo_gray)
    end
end
