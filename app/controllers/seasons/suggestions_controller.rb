class Seasons::SuggestionsController < ApplicationController
  before_action :load_season
  before_action :load_suggestion, only: [:edit, :update, :destroy]

  def pick
    @season.pick_suggestion!
    redirect_to @season
  end

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

  def edit
    breadcrumb
    add_breadcrumb t('buttons.edit')
  end

  def update
    if @suggestion.update(suggestion_params)
      redirect_to @season, notice: t('notices.successfully_updated', model: Season::Suggestion.model_name.human)
    else
      breadcrumb
      add_breadcrumb t('buttons.edit')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @suggestion.destroy
    redirect_to @season, notice: t('notices.successfully_destroyed', model: Season::Suggestion.model_name.human)
  end

  protected

  def breadcrumb
    super
    add_breadcrumb Season.model_name.human(count: 2), seasons_path
    add_breadcrumb @season, @season
    add_breadcrumb Season::Suggestion.model_name.human(count: 2)
    add_breadcrumb @suggestion if @suggestion&.persisted?
  end

  private

  def suggestion_params
    params.require(:season_suggestion).permit(:movie_tmdb_identifier, :picked_at).merge(
      user_id: current_user.id,
      season_id: @season.id
    )
  end

  def load_season
    @season = Season.find(params[:season_id])
  end

  def load_suggestion
    @suggestion = @season.suggestions.find_by!(user_id: current_user.id, id: params[:id])
  end
end
