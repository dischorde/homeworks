class Post < ApplicationRecord
  validates :author, :sub_id, :user_id, presence: true

  belongs_to :author,
             foreign_key: :user_id,
             primary_key: :id,
             class_name: :User,
             inverse_of: :posts

  belongs_to :sub
end
