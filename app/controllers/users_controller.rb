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
      redirect_to current_user
    else
      render :new
    end
  end

  def show
    @q = @contents.ransack(params[:q])
    @user_contents = @q.result(distinct: true).order("updated_at DESC").page(params[:page])
  end

  def edit
    
  end

  def update
    if @user.update(edit_user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to current_user
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
      params.require(:user).permit(:name, :email, :password, :qiita_token)
    end

    #edit用ストロングパラメーター
    def edit_user_params
      params.require(:user).permit(:name, :email, :qiita_token)
    end
end
