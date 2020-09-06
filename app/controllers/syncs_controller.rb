class SyncsController < ApplicationController
  before_action :my_post, only: :post_sync

  def post_sync
    @my_content.each do |m|
      Content.create(
        title: "#{m["title"]}",
        url: "#{m["url"]}",
        user_id: current_user.id
      )
    end

    @my_stock.each do |m|
      Content.create(
        title: "#{m["title"]}",
        url: "#{m["url"]}",
        user_id: current_user.id
      )
    end
      flash[:success] = 'Qiitaの投稿一覧とストックを同期しました。'
      redirect_to current_user
  end
end
