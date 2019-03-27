module Api
  # Controller for user registration
  class RegistrationController < ApplicationController
    def create
      user = User.new(user_params)

      if user.save
        user.generate_token!
        render json: user.as_json(only: %i[email authentication_token]), status: :created
      else
        render json: { errors: user.errors.full_messages }, status: 400
      end
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
