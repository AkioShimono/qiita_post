class SessionsController < ApplicationController
  before_action :login_judge, only: %i(new create)

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'ログインしました。'
      redirect_to current_user
    else
      flash[:danger] = 'メールアドレスかパスワードが間違っています。'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
