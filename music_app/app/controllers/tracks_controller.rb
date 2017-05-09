class TracksController < ApplicationController
  before_action :require_user!
  before_action :find_track, except: [:new, :create]

  def show
  end

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new(album_id: params[:album_id])
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      @album = @track.album
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track.destroy
    redirect_to album_url(@track.album_id)
  end

  private

  def find_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :album_id, :ord, :bonus, :lyrics)
  end
end
