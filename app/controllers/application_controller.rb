class ApplicationController < ActionController::API
  before_action :set_cors

  private

  def set_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
end
