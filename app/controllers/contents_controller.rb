class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    
    if @content = Content.create!(content_params)
      flash[:success] = 'コンテンツを登録しました。'
      redirect_to user_path(params[:user_id])
    else
      flash.now[:danger] = 'コンテンツの登録に失敗しました。'
      render :new
    end
  end

  def show

  end
    
  private
  #ストロングパラメーター
  def content_params
    params.require(:content).permit(:title, :url)
  end
end
