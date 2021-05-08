class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(can_id: params[:can_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @can = Can.find(params[:can_id])
    @like = current_user.likes.find_by(can_id: @can.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
