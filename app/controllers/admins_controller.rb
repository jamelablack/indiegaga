class AdminsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  private

  def require_admin
    if !current_user.admin?
      flash[:error] = "You must be an admin to do that."
      redirect_to home_path
    end
  end
end
