class Album < ApplicationRecord
  validates :name, :year, :band, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :name, uniqueness: { scope: :band_id }
  validates :year, numericality: { minimum: 1900, maximum: 9000 }

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
