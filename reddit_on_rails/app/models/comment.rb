class Comment < ApplicationRecord
  include Votable

  validates :body, :author, :post, presence: true
  after_initialize :ensure_post_id!

  belongs_to :post
  belongs_to :author,
             foreign_key: :user_id,
             primary_key: :id,
             class_name: :User,
             inverse_of: :comments

  belongs_to :parent_comment,
             optional: true,
             foreign_key: :parent_comment_id,
             primary_key: :id,
             class_name: :Comment


  has_many :child_comments,
           foreign_key: :parent_comment_id,
           primary_key: :id,
           class_name: :Comment

  private

  def ensure_post_id!
    self.post_id ||= self.parent_comment.post_id if parent_comment
  end
end
