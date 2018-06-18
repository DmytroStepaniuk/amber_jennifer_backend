class UsersController < ApplicationController
  before_action do
    only :create { create_params.validate! }
  end

  def create
    pp create_params.to_h

    pp Crypto::Bcrypt::Password.create("123").to_s

    resource = User.build(
      email:                 create_params[:email],
      password:              create_params[:password],
      password_confirmation: create_params[:password_confirmation],
    )

    respond_with do
      if resource.save
        json(resource.to_json)
      else
        json(errors_of(resource).to_json)
      end
    end
  end

  private def create_params
    params.validation do
      required(:email) { |p| p.is_a? String }
      optional(:password) { |p| p.is_a? String }
      optional(:password_confirmation) { |p| p.is_a? String }
    end
  end
end
