class ApplicationController < ActionController::Base
include SessionsHelper

  def mycontents
    @contents = Content.where(user_id: params[:id])
  end
  
  def my_post
      begin
      response = URI.open(
        "https://qiita.com/api/v2/authenticated_user/items?page=1&per_page=100",
        'Authorization' => "Bearer #{current_user.qiita_token}"
      )
      @my_content = JSON.parse(response.read)

      rescue
        flash[:danger] = 'Qiitaトークンが異なっています'
        redirect_to edit_user_path(current_user)
      end
  end

  def my_stock
      begin
        response = URI.open(
          "https://qiita.com/api/v2/users/#{current_user.name}/stocks?page=1&per_page=100"
        )
        @my_stock = JSON.parse(response.read)

      rescue
        flash[:danger] = 'Qiitaの名前と異なっています'
        redirect_to edit_user_path(current_user)
      end
  end

  def login_judge
    if logged_in?
      redirect_to current_user
    end
  end

  def authority
    unless current_user?(@user)
      flash[:danger] = '閲覧権限のないページです'
      redirect_to current_user
    end
  end

  private
  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end
end
