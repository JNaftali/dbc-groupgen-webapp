class PagesController < ApplicationController
  def login
    redirect_to '/cohorts' if login?
  end

  def new_session
    @user = User.find_by_username(params[:login]) || User.find_by_email(params[:login])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/cohorts'
    else
      render 'login'
    end
  end

  def logout
  end
end
