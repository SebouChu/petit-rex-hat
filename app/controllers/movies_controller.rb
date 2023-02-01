class MoviesController < ApplicationController
  before_action :load_movie, only: [:show, :destroy]

  def index
    @movies = Movie.order(:title_fr)
    breadcrumb
  end

  def search
    @season = Season.find(params[:season_id])
    @results = TheMovieDb.search(params[:query])
    respond_to do |format|
      format.js
    end
  end

  def show
    breadcrumb
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: t('notices.successfully_destroyed', model: @movie.to_s)
  end

  protected

  def breadcrumb
    super
    add_breadcrumb Movie.model_name.human(count: 2), movies_path
    add_breadcrumb @movie, @movie if @movie.present?
  end

  def load_movie
    @movie = Movie.find(params[:id])
  end
end
