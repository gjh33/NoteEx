class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { :in => 3..20 }
  validates :password, :confirmation => true
  validates :password_confirmation, presence: true, on: :create
  validates_length_of :password, in: 6..20, on: :create

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.encrypted_password = Digest::SHA1.hexdigest(password)
    end
  end

  def clear_password
    self.password = nil
  end
end
