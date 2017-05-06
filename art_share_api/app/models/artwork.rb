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

  def self.find_owned_and_shared(user_id)
    owned = "artworks.artist_id = :user_id"
    shared = "artwork_shares.viewer_id = :user_id"

    outer_join_shares = <<-SQL
      LEFT OUTER JOIN
        artwork_shares ON artworks.id = artwork_shares.artwork_id
    SQL

    Artwork
      .joins(outer_join_shares)
      .where("#{owned} OR #{shared}", user_id: user_id)
      .distinct
  end

end
