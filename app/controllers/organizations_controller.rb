class OrganizationsController < ApplicationController
  def show
    @org = Organization.find_by_id(params[:id])
    @user = User.all
    @member = User.where(org_id: @org.id)
  end

  def index
  end
  def new
    @organization = Organization.new
  end
  def create
    @user = current_user
    @organization = Organization.new(org_params)
    @organization.save
    redirect_to users_path
  end

  def join
    @org = Organization.find(params[:id])
    @user = current_user
    x = User.update(@user.id, org_id: @org.id)
    x.save
    redirect_to @org
  end

  def edit
    @org = Organization.find(params[:id])
    x = Organization.update(@org.id, description: params[:description], school_admin: params[:school_admin], avatar: params[:avatar], avatar2: params[:avatar2], avatar3: params[:avatar3])
    x.save
    redirect_to @org
  end

  def update
    @org = Organization.find(params[:id])
  end

  private
  def org_params
    params.require(:organization).permit(:user_id, :name, :description, :school_admin, :school_origin, :avatar, :avatar2, :avatar3)
  end


end
