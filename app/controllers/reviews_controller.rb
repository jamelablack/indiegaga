class ReviewsController < ApplicationController
  before_filter :require_user


  def create
    @artist = Artist.find(params[:artist_id])

    review = @artist.reviews.build (review_params).merge!(user: current_user)

    if review.save
      redirect_to @artist
    else
      @reviews = @artist.reviews.reload
      render 'artists/show'
    end
  end

  private
  def review_params
    params.require(:review).permit!
  end
end
