class MoviesController < ApplicationController
  def show
    @logbook = Logbook.find(params[:logbook_id])
    @recommendations = @logbook.emoji.movies
  end
end
