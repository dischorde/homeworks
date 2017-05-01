class User < ApplicationRecord
  validates :name, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, :name, uniqueness: true
  attr_reader :password
  after_initialize :ensure_session_token

  has_many :votes

  has_many :subs,
           primary_key: :id,
           foreign_key: :moderator_id,
           class_name: :Sub,
           inverse_of: :moderator

  has_many :posts,
           foreign_key: :user_id,
           primary_key: :id,
           class_name: :Post,
           inverse_of: :author

  has_many :comments,
           foreign_key: :user_id,
           primary_key: :id,
           class_name: :Comment,
           inverse_of: :author

  def self.find_by_credentials(name, password)
    user = User.find_by(name: name)
    user.try(:is_password?, password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def is_password?(pass)
    BCrypt::Password.new(password_digest).is_password?(pass)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
