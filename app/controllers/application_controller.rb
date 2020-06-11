class ApplicationController < ActionController::API
  include Response
  # use Rack::Throttle::Interval, :min => 3.0
  # use Rack::Throttle::Minute,   :max => 5

  # ------------ GET REQUEST SUGGESTION ------------
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :unprocessable_entity)
  end

  # -------------DELETE REQUEST MESSAGES------------
  rescue_from ActionController::RoutingError do |exception|
    json_response({ message: exception.message }, :not_found)
  end
end
