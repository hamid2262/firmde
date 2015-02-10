class BlocksController < ApplicationController
  layout "admin_layout"
  before_action :set_block, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /blocks
  # GET /blocks.json
  def index
    @blocks = Block.all
  end

  def show
  end

  def new
    @block = Block.new
    if params[:title].present?
      @block.title = params[:title]
    end
  end

  def edit
  end

  def create
    @block = Block.new(block_params)
    @block.title = params[:title] if params[:title].present?
    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.json { render :show, status: :created, location: @block }
      else
        format.html { render :new }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { render :show, status: :ok, location: @block }
      else
        format.html { render :edit }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url, notice: 'Block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_block
      @block = Block.find(params[:id])
    end

    def block_params
      params.require(:block).permit(:title, :body, :css_classes, :css_id)
    end
end
