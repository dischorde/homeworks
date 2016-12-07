class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  def password=(password)
   @password = password
   self.password_digest = BCrypt::Password.create(password)
  end

  def find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?

    user.password_digest.is_password?(password) ? user : nil
    end
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  def generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

end
