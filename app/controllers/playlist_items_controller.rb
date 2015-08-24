class PlaylistItemsController < ApplicationController
  before_filter :require_user

  def index
    @playlist_items = current_user.playlist_items
  end

  def create
    song = Song.find(params[:song_id])
    queue_song(song)
    redirect_to my_playlist_path
  end

  def destroy
    playlist_item = PlaylistItem.find(params[:id])
    playlist_item.destroy if current_user.playlist_item.include?(playlist_item)
    current_user.normalize_playlist_item_positions
    redirect_to my_playlist_path
  end

  def update_playlist
    begin
      update_playlist_items
      current_user.normalize_playlist_item_positions
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "Invalid position number. Please try again."
    end
    redirect_to my_playlist_path
  end


  private

  def queue_song(song)
    PlaylistItem.create(song: song, user: current_user, position: new_playlist_item_position) unless previously_queued_song?(song)
  end

  def new_playlist_item_position
    current_user.playlist_items.count + 1
  end

  def previously_queued_song?(song)
    current_user.playlist_items.map(&:song).include?(song)
  end

  def update_playlist_items
    ActiveRecord::Base.transaction do
      params[:playlist_items].each do |playlist_item_data|
        playlist_item = PlaylistItem.find(playlist_item_data["id"])
        queue_item.update_attributes!(position: playlist_item_data["position"]) if playlist_item.user == current_user
      end
    end
  end
end
