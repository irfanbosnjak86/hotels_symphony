# frozen_string_literal: true

# nodoc
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  enum role: %i[admin regular_user]
end
