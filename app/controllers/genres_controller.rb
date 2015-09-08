class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @artists = @genre.artists
  end
end
