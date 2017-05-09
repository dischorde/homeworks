class AlbumsController < ApplicationController
  before_action :require_user!
  before_action :find_album, except: [:new, :create]

  def show
  end

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: params[:band_id])
  end

  def create
    @album = Album.new(album_params)

    if @album.save!
      redirect_to album_url(@album)
    else
      @band = @album.band
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album.destroy
    @album
  end

  private

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :band_id, :year, :live)
  end
end
