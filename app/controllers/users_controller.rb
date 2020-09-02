class UsersController < ApplicationController
before_action :mycontents, only: :show
before_action :set_user, only: %i(edit update destroy)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) #user_paramsはPOSTデータをチェックするメソッド
    
    if @user.save
      log_in(@user)
      flash[:success] = '新しいユーザーを登録しました。'
      redirect_to root_url
    else
      render :new
    end
  end

  def show  

  end
  
  def edit
    
  end

  def update
    if @user.update(edit_user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    log_out
    @user.destroy
    flash[:success] = 'ユーザー情報を削除しました。'
    redirect_to root_url
  end

  def set_user
    @user = User.find(params[:id])
  end

  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    #edit用ストロングパラメーター
    def edit_user_params
      params.require(:user).permit(:name, :email)
    end
end
