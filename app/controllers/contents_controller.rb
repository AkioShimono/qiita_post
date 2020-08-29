class ContentsController < ApplicationController

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      flash[:success] = 'コンテンツを登録しました。'
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  def show

  end
    
  private
  #ストロングパラメーター
  def content_params
    params.require(:content).permit(:title, :url, :user_id)
  end
end
