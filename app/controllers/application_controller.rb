class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def breadcrumb
    add_breadcrumb I18n.t('home'), root_path
  end
end
