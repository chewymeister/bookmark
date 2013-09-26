require 'bcrypt'

class User
	attr_reader :password
	attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true
  property :password_digest, Text
  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"
  validates_uniqueness_of :email, :message => "This email is already taken"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end