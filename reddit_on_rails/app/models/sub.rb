class Sub < ApplicationRecord
  validates :title, :description, :moderator_id, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator,
             foreign_key: :moderator_id,
             primary_key: :id,
             class_name: :User,
             inverse_of: :subs

  has_many :post_subs, dependent: :destroy
  has_many :posts, through: :post_subs, source: :post
end
