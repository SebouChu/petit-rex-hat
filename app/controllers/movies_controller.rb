class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:title_fr)
    breadcrumb
  end

  def show
    @movie = Movie.find(params[:id])
    breadcrumb
  end

  protected

  def breadcrumb
    super
    add_breadcrumb Movie.model_name.human(count: 2), movies_path
    add_breadcrumb @movie, @movie if @movie.present?
  end
end
