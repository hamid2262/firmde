class ElementsController < ApplicationController
  layout "admin_layout", except: :edit
  before_action :set_element, only: [:show, :edit, :update, :destroy, :remove_photo]
  before_action :set_slideshow, only: [:show,:index, :new, :create, :edit, :update, :destroy]
  
  before_action :set_breadcrumbs, only: [:show, :edit, :index, :new]
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
        format.html { redirect_to @slideshow, notice: 'element was successfully created.' }
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
        # format.html { redirect_to :back, notice: 'element was successfully updated.' }
        format.html { redirect_to :back }
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
      format.html { redirect_to @slideshow, notice: 'element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_photo
    @element.photo.destroy
    @element.photo.clear
    @element.save
    redirect_to :back, alert: "image has been removed"
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

    def set_breadcrumbs
      @breadcrumbs = []
      @breadcrumbs << {name: "Slideshow", link: slideshows_path }      
      @breadcrumbs << {name: "Elements", link: slideshow_elements_path }      
      set_action unless params[:action] == "index"
    end
    def set_action
      @breadcrumbs << {name: params[:action], link: "#" }      
      
    end
end
