class Artwork < ApplicationRecord
  validates :title, :image_url, :artist, null: false
  validates :title, uniqueness: { scope: :artist }

  has_many :artwork_shares

  has_many :shared_viewers,
           through: :artwork_shares,
           source: :viewer

  belongs_to :artist,
             class_name: :User,
             foreign_key: :artist_id
end
