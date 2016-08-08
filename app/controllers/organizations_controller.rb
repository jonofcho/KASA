class OrganizationsController < ApplicationController
  def show
    @org = Organization.find_by_id(params[:id])
  end

  def index
  end
  def create
    o = Organization.new(org_params)
    o.save
    redirect_to current_user
  end

  private
  def org_params
      params.require(:organization).permit(:user_id, :name, :school_origin)
  end

end
