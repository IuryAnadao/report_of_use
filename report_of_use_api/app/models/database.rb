class Database < ApplicationRecord

  before_save :encrypted_password

  def encrypted_password
    self.password = BCrypt::Password.create(self.password)
  end
end
