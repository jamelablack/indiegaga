class FavsController < ApplicationController

  before_filter :require_user

  def index
    @favs = current_user.fan_relationships
  end

  def destroy
    fav = Fav.find(params[:id])
    fav.destroy if fav.fan_id == current_user
    redirect_to favorites_path
  end

  def create
    icon = Artist.find(params[:icon_id]
    Fav.create(:icon_id: params[:icon_id], fan:  current_user) if current_user.can_follow?(icon)
    redirect_to favorites_path
  end

end
