# nodoc
class ApplicationController < ActionController::API
  attr_reader :current_user

  def access_token
    headers && /Bearer (\w+)/ =~ headers['Authorization'] ? Regexp.last_match(1) : nil
  end

  # This method should be called in before block of the endpoint to protect the resource
  def authenticate!
    @current_user ||= User.find_by!(authentication_token: access_token)
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Unauthorized' }, status: 401
  end

  def authorized!
    render json: { message: 'Unauthorized' }, status: 401 unless @current_user.admin?
  end
end
