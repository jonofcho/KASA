class OrganizationsController < ApplicationController
  def show
    @org = Organization.find_by_id(params[:id])
    @user = current_user
    @member = User.where(org_id: @org.id)
    if Organization.find_by_name("Chongdae")
      @chongdae = Organization.find_by_name("Chongdae")
    end
    @kasa = Organization.find_by_id(@user.org_id)
  end

  def index
  end
  def new
    @user = current_user
    @organization = Organization.new
  end
  def create
    @user = current_user
    @organization = Organization.new(org_params)
    @organization.user_id = current_user.id
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
    @user = current_user
    @members = User.where(org_id: @org.id)
    if @members.status == 0
      @status= "Active Member"
    elsif @members.status == 1
      @status = "Member"
    else
      @status = "Alumni"
    end
  end

  def update
    @org = Organization.find(params[:id])
    @org.update_attributes(org_params)
    redirect_to @org
  end

  def chongdae
    @chongdae = Organization.find_by_name("Chongdae")
    @user = current_user
    @users = User.all.where("id != ?", current_user.id)
    @org = Organization.all.where("name != ?", "Chongdae")
  end
  def remove_from_org
    
  end

  def new_member
    @user = current_user
  end


  private
  def org_params
    params.require(:organization).permit(:user_id, :name, :description, :school_admin, :school_origin, :avatar, :avatar2, :avatar3)
  end


end
