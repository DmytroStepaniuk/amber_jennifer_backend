class User < ApplicationRecord
  with_timestamps

  mapping(
    id:                     {type: Int32 | Int64, primary: true}, # Primary32, # same as {type: Int32, primary: true}
    email:                  {type: String?},
    created_at:             {type: Time, null: false, default: Time.now},
    updated_at:             {type: Time, null: false, default: Time.now}
  )

  def to_json
    {
      email: email
    }.to_json
  end

  # has_many :messages, Message
end
