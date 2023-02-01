class SeasonsController < ApplicationController
  before_action :load_season, only: [:show, :edit, :update, :destroy]

  def index
    @seasons = Season.order(created_at: :desc)
    breadcrumb
  end

  def show
    @user_suggestions = @season.suggestions.where(user_id: current_user.id).order(:created_at)
    @picked_suggestions = @season.suggestions.picked.order(picked_at: :desc)
    @remaining_suggestions = @season.suggestions.not_picked
    @last_picked_suggestion = @picked_suggestions.first
    breadcrumb
  end

  def new
    @season = Season.new
    breadcrumb
    add_breadcrumb t('buttons.add')
  end

  def edit
    breadcrumb
    add_breadcrumb t('buttons.edit')
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to @season, notice: t('notices.successfully_created', model: @season.to_s)
    else
      breadcrumb
      add_breadcrumb t('buttons.add')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @season.update(season_params)
      redirect_to @season, notice: t('notices.successfully_updated', model: @season.to_s)
    else
      breadcrumb
      add_breadcrumb t('buttons.edit')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @season.destroy
    redirect_to seasons_url, notice: t('notices.successfully_destroyed', model: @season.to_s)
  end

  protected

  def breadcrumb
    super
    add_breadcrumb Season.model_name.human(count: 2), seasons_path
    add_breadcrumb @season, @season if @season&.persisted?
  end

  private

  def season_params
    params.require(:season).permit(:name, :status, :god_mode)
  end

  def load_season
    @season = Season.find(params[:id])
  end
end
