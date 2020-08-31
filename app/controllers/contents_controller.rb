class ContentsController < ApplicationController

  before_action :set_content, only: %i(edit update destroy)

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
  
  def edit
    
  end

  def update
    @content.update(params.require(:content).permit(:title, :url, :memo, :user_id))
    flash[:success] = 'コンテンツを編集しました。'
    redirect_to user_path(params[:user_id])
  end

  def destroy
    @content.destroy
    flash[:success] = 'コンテンツを削除しました。'
    redirect_to user_path(params[:user_id])
  end

  private

  def set_content
    @content = Content.find(params["id"])
  end

  #ストロングパラメーター
  def content_params
    params.require(:content).permit(:title, :url, :memo, :user_id)
  end
end
