class BandsController < ApplicationController
  before_action :require_user!
  before_action :find_band, except: [:index, :new, :create]

  def index
    @bands = Band.all
  end

  def show
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band.destroy
    redirect_to bands_url
  end

  private

  def find_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
