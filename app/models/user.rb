class User < ApplicationRecord
  attr_reader :remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name,     presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email,    presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def create_remember_token
    @remember_token = User.new_token
  end

  # Creates and returns the digest of the input
  def User.digest(input)
    # Lower the cost if possible for saving time
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(input)
  end

  # Returns a new random token
  def User.new_token
    SecureRandom.urlsafe_base64 
  end
end
