class PostsController < ApplicationController
  def index
      1.upto(100) do |i|
        # 記事一覧を取得
        response = URI.open(
          # "https://qiita.com/api/v2/users/NoA_okku/items"
          "https://qiita.com/api/v2/authenticated_user/items?page=#{i}&per_page=100",
          'Authorization' => "Bearer #{ENV["qiita_token"]}"
        )
        @my_post = JSON.parse(response.read)
        debugger
        # 記事が見つからなかった場合は終了する
        break if my_post.empty?
      end
  end
end
