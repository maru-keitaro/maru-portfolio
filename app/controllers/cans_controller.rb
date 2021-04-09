class CansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :set_search]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_search, only: [:index, :set_search]

  def index
    @cans = Can.all.order("created_at DESC")
  end

  def new
    @can = Can.new
  end

  def create
    @can = Can.new(can_params)
    if @can.valid?
      @can.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @can = Can.find(params[:id])
    @comment = Comment.new
    @comments = @can.comments.includes(:user)
  end

  def edit
    # @can = Can.find(params[:id])
  end

  def update
    # @can = Can.find(params[:id])
    @can.update(can_params)
    if @can.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    # @can = Can.find(params[:id])
    @can.destroy
    redirect_to root_path
  end

  def set_search
    @search = Can.ransack(params[:q])
    @cans = @search.result
  end

  private

  def set_item
    @can = Can.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && @current_user.id == @can.user_id
      redirect_to action: :index
    end
  end

  def can_params
    params.require(:can).permit(:active_id, :place_id, :set_time_id, :description, :image).merge(user_id: current_user.id)
  end
  
end
