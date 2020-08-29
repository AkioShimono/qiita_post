class ApplicationController < ActionController::Base
  include SessionsHelper

def mycontents
  @contents = Content.where(user_id: params[:id])
end

private
# ログイン済みユーザーかどうか確認
 def logged_in_user
   unless logged_in?
     redirect_to login_url
    end
  end
end
