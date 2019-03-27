module API
  # basic health controller
  class HealthController < ApplicationController
    def index
      render json: { status: 'healthy' }, status: 200
    end
  end
end
