class PostsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
end
