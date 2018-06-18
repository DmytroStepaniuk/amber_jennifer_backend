require "crypto/bcrypt/password"

class User < ApplicationRecord
  with_timestamps

  table_name "users"

  mapping(
    id:                     Primary32,# same as {type: Int32, primary: true}
    email:                  {type: String?},
    password_digest:        String?,
    created_at:             {type: Time, null: false, default: Time.now},
    updated_at:             {type: Time, null: false, default: Time.now}
  )

  property password : String?

  property password_confirmation : String?

  # validates_presence :password_confirmation

  validates_uniqueness :email

  validates_confirmation :password

  validates_with_method :custom_error_is_here

  before_validation :setup_password_digest

  def custom_error_is_here
    # errors.add :base, "Custome error is here!"
  end

  def to_json
    {
      id:                    id,
      email:                 email,
      password_confirmation: password_confirmation,
      password_digest:       password_digest,
      created_at:            created_at
    }.to_json
  end

  def setup_password_digest
    return if password.nil?

    self.password_digest = Crypto::Bcrypt::Password.create(password.to_s).to_s

    pp self.password_digest
  end
end
