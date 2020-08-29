class UsersController < ApplicationController
before_action :mycontents, only: :show

def new
  @user = User.new
end

def create
  @user = User.new(user_params) #user_paramsはPOSTデータをチェックするメソッド
   
   if @user.save
    flash[:success] = '新しいユーザーを登録しました。'
     redirect_to @user
  else
     render :new
  end
 end

def show
 
end
   
private
#ストロングパラメーター
def user_params
  params.require(:user).permit(:name, :email, :password)
end

end
