class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :pundishing_user

  private

  def pundishing_user
    flash[:notice] = 'You are not authorized to perform this action.'
    redirect_to article_path
  end
end
