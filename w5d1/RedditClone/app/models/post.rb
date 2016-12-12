class Post < ActiveRecord::Base
  has_many :post_subs
  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :comments

end
