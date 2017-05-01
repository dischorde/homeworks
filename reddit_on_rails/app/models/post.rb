class Post < ApplicationRecord
  validates :author, :user_id, :title, presence: true
  validates :subs, presence: { message: "must have at least one associated sub" }

  belongs_to :author,
             foreign_key: :user_id,
             primary_key: :id,
             class_name: :User,
             inverse_of: :posts

  has_many :post_subs, dependent: :destroy
  has_many :subs, through: :post_subs, source: :sub
end
