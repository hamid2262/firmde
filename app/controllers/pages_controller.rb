class PagesController < ApplicationController
  layout "admin_layout", except: [:show]
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @pages = Page.all
  end

  def show
    redirect_to root_path if @page == Page.root
  end

  def new
    @page = Page.new
    @page.parent_id = params[:parent_id]
  end

  def edit
    @page_backups = @page.page_backups.order("updated_at desc").limit(10)
  end

  def create
    @page  = Page.new(page_params)
    @page.parent_id  = Page.find(params[:parent_id]).id if params[:parent_id].present?
    respond_to do |format|
      if @page.save
        build_page_backup  
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @page.ancestors.include? Page.loesungen
      destination = admin_loesungen_path
    else
      destination = @page
    end
    respond_to do |format|
      build_page_backup
      if @page.update(page_params)
        format.html { redirect_to destination, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :title_on_image, :subtitle_on_image, :body, :photo, :parent_id, :order, :slug, :visible_on_sidebar, :visible_on_navbar, :pictogram, :pictogram_hover)
    end

    def page_backup_params
      params.require(:page).permit(:title, :title_on_image, :subtitle_on_image, :body, :slug)
    end

    def build_page_backup  
      page_backup = @page.page_backups.build(page_backup_params)
      page_backup.user = current_user
      page_backup.save
    end
end
