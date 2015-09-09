class Admin::AlbumsController < AdminsController
  def new
    @album = Album.new
  end

  def create
    @album = Ablum.new(album_params)
    if @album.save
      flash[:success] = "You have successfully added '#{@album.title}'."
      redirect_to new_admin_artist_path
    else
      flash[:error] = "Opps - the album was not added properly. Please try again."
      render :new
    end
  end


  private

  def album_params
    params.require(:album).permit!
  end
end
