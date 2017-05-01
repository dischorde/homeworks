class Post < ApplicationRecord
  include Votable

  validates :author, :user_id, :title, presence: true
  validates :subs, presence:
    { message: "must have at least one associated sub" }

  belongs_to :author,
             foreign_key: :user_id,
             primary_key: :id,
             class_name: :User,
             inverse_of: :posts

  has_many :post_subs, dependent: :destroy
  has_many :subs, through: :post_subs, source: :sub
  has_many :comments

  def comments_by_parent
    parent_comments = Hash.new { |h, k| h[k] = [] }

    self.comments.includes(:author).each do |comment|
      parent_comments[comment.parent_comment_id] << comment
    end

    parent_comments
  end
end
