class UsersController < ApplicationController
    def index
      @user = current_user
      @org = Organization.all
      x = User.all
      y = User.first.id
      z = rand(y..x.count)
      @feature = User.find_by_id(z)
      @chongdaepost = Post.where(category: 1)
      @kasa = Organization.find_by_id(@user.org_id)
      @kasapost = Post.where(category: 2)
    end

    def show
      @user = current_user
      @member = User.find_by_id(params[:id])
    end

    def search
      @users = User.all
      if params[:search]
        @users = User.search(params[:search]).order("created_at DESC")
      else
        @users = User.all.order('created_at DESC')
      end
    end
end
