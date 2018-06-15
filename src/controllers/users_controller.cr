class UsersController < ApplicationController
  def create
    pp "something wents here"

    resource = User.build(email: "some@exmaple.com")

    pp resource.valid?

    resource.save!

    respond_with do
      json({ base: "somethings wents here!", count: User.all.count }.to_json)
    end
  end
end
