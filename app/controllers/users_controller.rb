class UsersController < ApplicationController
    def index

    end

    def show
      @user = current_user
      @org = Organization.all
      x = User.all
      y = User.first.id
      z = rand(y..x.count)
      @feature = User.find_by_id(z)
      @chongdaepost = Post.where(category: 1)
      @kasapost = Post.where(category: 2)

    end

    def profile

    end

end
