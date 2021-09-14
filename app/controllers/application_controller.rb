class ApplicationController < ActionController::API
  before_action :cors_set_access_control_headers

  def cors_preflight_check
    return unless request.method == 'OPTIONS'

    cors_set_access_control_headers
    render json: {}
  end

  protected

  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
  end
end
