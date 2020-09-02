class ApplicationController < ActionController::Base
include SessionsHelper

  def mycontents
    @contents = Content.where(user_id: params[:id])
  end
  
  def my_post
    1.upto(100) do |i|
      # 記事一覧を取得
      response = URI.open(
        # "https://qiita.com/api/v2/users/NoA_okku/items"
        "https://qiita.com/api/v2/authenticated_user/items?page=#{i}&per_page=100",
        'Authorization' => "Bearer #{ENV["qiita_token"]}"
      )
      @my_post = JSON.parse(response.read)
      # 記事が見つからなかった場合は終了する
      break if my_post.empty?
    end
  end

  def my_stock
    1.upto(100) do |i|
      # 記事一覧を取得
      response = URI.open(
        "https://qiita.com/api/v2/users/NoA_okku/stocks?page=#{i}&per_page=100"
      )
      @my_stock = JSON.parse(response.read)
      # 記事が見つからなかった場合は終了する
      break if my_stock.empty?
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
