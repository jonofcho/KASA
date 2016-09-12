class LogisticsController < ApplicationController

  def update
    @org = Organization.find(params[:id])
    if @logistic = Logistic.find_by_organization_id(params[:id])
      @logistic.update_attributes(logistic_params)
      redirect_to @org
    else
      @logistic = Logistic.create(logistic_params)
      @logistic.organization_id = params[:id]
      @logistic.save
      redirect_to @org
    end
  end

  private
  def logistic_params
    params.require(:logistic).permit(:meeting_location, :next_meeting, :time)
  end
end
