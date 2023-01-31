class Seasons::SuggestionsController < ApplicationController
  before_action :load_season

  def new
    @suggestion = @season.suggestions.new
    breadcrumb
    add_breadcrumb t('buttons.add')
  end

  def create
    @suggestion = @season.suggestions.new(suggestion_params)
    if @suggestion.save
      redirect_to @season, notice: t('notices.successfully_created', model: Season::Suggestion.model_name.human)
    else
      breadcrumb
      add_breadcrumb t('buttons.add')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @suggestion = @season.find_by(user_id: current_user.id, id: params[:id])
    @suggestion.destroy
    redirect_to @season, notice: t('notices.successfully_destroyed', model: Season::Suggestion.model_name.human)
  end

  protected

  def breadcrumb
    super
    add_breadcrumb Season.model_name.human(count: 2), seasons_path
    add_breadcrumb @season, @season
    add_breadcrumb Season::Suggestion.model_name.human(count: 2)
  end

  private

  def suggestion_params
    params.require(:season_suggestion).permit(:movie_tmdb_identifier).merge(
      user_id: current_user.id,
      season_id: @season.id
    )
  end

  def load_season
    @season = Season.find(params[:season_id])
  end
end
