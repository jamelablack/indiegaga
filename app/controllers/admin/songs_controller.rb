class Admin::SongsController < AdminsController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "Songs added successfully!"
      redirect_to new_admin_songs_path
    else
      flash[:error] = "Your songs were not added properly. Please try again."
      render :new
    end
  end

  private

  def song_params
    params.require(:song).permit!
  end
end
