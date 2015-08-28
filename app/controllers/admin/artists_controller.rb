class Admin::ArtistsController < AdminsController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "You have successfully added '#{@artist.name}'."
      redirect_to new_admin_artist_path
    else
      flash[:error] = "Opps - the artist was not added properly"
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit!
  end
end
