require 'bcrypt'
class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  has_many :tweets
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
