class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: %i[edit update destroy]
  respond_to :html, :js

  def new
    @location = Location.new
  end

  def edit; end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      redirect_to cv_url, flash: { success: t('success.location.create') }
    else
      render 'locations/errors'
    end
  end

  def update
    if @location.update(location_params)
      redirect_to cv_url, flash: { success: t('success.cv.update') }
    else
      render 'locations/errors'
    end
  end

  def destroy
    @location.destroy
    redirect_to cv_url, flash: { success: t('success.location.destroy') }
  end

  private

  def set_location
    @location = current_user.locations.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:address, :radius, :title)
  end
end
