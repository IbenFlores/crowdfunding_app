class DashboardsController < ApplicationController
  def show
    @user = Current.session.user
    @donations = @user.donations.includes(:project)
  end
end