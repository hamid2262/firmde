class ElementsController < ApplicationController
  layout "admin_layout"
  before_action :set_element, only: [:show, :edit, :update, :destroy]
  before_action :set_slideshow, only: [:show,:index, :new, :create, :edit, :update, :destroy]
  authorize_resource

  def index
    @elements = @slideshow.elements
  end

  def show
  end

  def new
    @element = @slideshow.elements.build
  end

  def edit
  end

  def create
    @element = @slideshow.elements.build(element_params)
    respond_to do |format|
      if @element.save
        format.html { redirect_to slideshow_element_path(@slideshow, @element), notice: 'element was successfully created.' }
        format.json { render :show, status: :created, location: @element }
      else
        format.html { render :new }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @element.update(element_params)
        format.html { redirect_to :back, notice: 'element was successfully updated.' }
        # format.html { redirect_to [@slideshow, @element], notice: 'element was successfully updated.' }
        format.json { render :show, status: :ok, location: [@slideshow, @element]}
      else
        format.html { render :edit }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @element.destroy
    respond_to do |format|
      format.html { redirect_to elements_url, notice: 'element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_element
      @element = Element.find(params[:id])
    end
    def set_slideshow
      @slideshow = Slideshow.find(params[:slideshow_id])
    end

    def element_params
      params.require(:element).permit(:tag, :klass, :body, :href, :x, :y, :speed, :start, :easing, :photo, :slideshow_id)
    end
end
