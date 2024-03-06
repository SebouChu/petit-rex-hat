class HomeController < ApplicationController
  def index
    @season = Season.current
    @current_suggestion = @season.suggestions.picked.order(picked_at: :desc).first if @season.present?
    breadcrumb
  end
end
