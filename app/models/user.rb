# nodoc
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  enum role: %i[admin regular_user]

  def generate_token!
    update!(authentication_token: SecureRandom.hex(15))
  end
end
