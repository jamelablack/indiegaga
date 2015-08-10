class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    @genres = Genre.all
  end

  def show
    @artist = ArtistDecorator.decorate(Artist.find(params[:id]))
    @albums = @artist.albums
    @reviews = @artist.reviews
  end

  def search
    @results = Artist.search_by_name(params[:search_term])
  end
end
