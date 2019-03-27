module Api
  # Controller for authenticating user
  class AuthController < ApplicationController
    def create
      user = User.find_by!(email: params[:email])

      if user && user.authenticate(params[:password])
        user.generate_token
        render json: user.as_json(only: %i[email authentication_token]), status: :created
      else
        render json: { message: 'Unauthenticated' }, status: 401
      end
    end
  end
end
