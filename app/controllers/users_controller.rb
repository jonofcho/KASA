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
      if Organization.find_by_name("Chongdae")
        @chongdae = Organization.find_by_name("Chongdae")
      end
    end

    def show
      @user = current_user
      @member = User.find_by_id(params[:id])
      if Organization.find_by_name("Chongdae")
        @chongdae = Organization.find_by_name("Chongdae")
      end
      @kasa = Organization.find_by_id(@user.org_id)
    end

    def search
      @user = current_user
      @users = User.all
      if params[:search]
        @users = User.search(params[:search]).order("created_at DESC")
      else
        @users = User.all.order('created_at DESC')
      end
    end

    def create_new_member
      @org = Organization.find_by_id(current_user.org_id)
      @new_member = User.create(new_member_params)
      if @new_member.save
        flash[:message] = "Successful member sign-up! Go again"
        redirect_to :back
      else
        flash[:message] = @new_member.errors.full_messages
        redirect_to :back
      end
    end

    private
    def new_member_params
        params.require(:user).permit(:email, :first_name, :last_name, :password, :org_id)
    end
end
