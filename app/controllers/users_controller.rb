class UsersController < ApplicationController
    def index

    end

    def show
      @user = current_user
    end

    # def destroy
    #   sign_out @user
    #   redirect_to :root
    # end
end
