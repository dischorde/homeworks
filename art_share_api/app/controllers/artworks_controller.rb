class ArtworksController < ApplicationController
  before_action :find_artwork, except: [:index, :create]

  def index
    @artworks = Artwork.find_owned_and_shared(params[:user_id])
    render json: @artworks
  end

  def show
    render json: @artwork
  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render json: @artwork, status: :created
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def update
    if @artwork.update(artwork_params)
      render json: @artwork, status: :updated
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork.destroy
    render json: @artwork
  end

  private

  def find_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
