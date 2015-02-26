class SubPagesController < ApplicationController
  layout "admin_layout", except: [:show]
  before_action :set_page #, only: [:show, :edit, :update, :destroy]
  before_action :set_sub_page, only: [:show, :edit, :update, :destroy]
  authorize_resource

  respond_to :html

  def index
    @sub_pages = @page.sub_pages
    respond_with(@sub_pages)
  end

  def show
    respond_with(@sub_page)
  end

  def new
    @sub_page = SubPage.new
    @sub_page.page = @page

    respond_with(@sub_page)
  end

  def edit
  end

  def create
    @sub_page = SubPage.new(sub_page_params)
    @sub_page.page = @page
    @sub_page.save
    # respond_with(@sub_page)
    redirect_to page_sub_page_path(id: @sub_page.id)

  end

  def update
    @sub_page.update(sub_page_params)
    redirect_to page_sub_page_path(id: @sub_page.id)
    # respond_with(@sub_page)
  end

  def destroy
    @sub_page.destroy
    respond_with(@sub_page)
  end

  private
    def set_sub_page
      @sub_page = SubPage.find(params[:id])
    end

    def set_page
      @page = Page.find params[:page_id]
    end

    def sub_page_params
      params.require(:sub_page).permit(:title, :seo_title, :body, :page_id, :order, :slug)
    end

end
