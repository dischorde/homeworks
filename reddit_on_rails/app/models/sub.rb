class Sub < ApplicationRecord
  validates :title, :description, :moderator_id, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator,
             foreign_key: :moderator_id,
             primary_key: :id,
             class_name: :User,
             inverse_of: :subs

end
