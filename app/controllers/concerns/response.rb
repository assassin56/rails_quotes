module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
# trying to move exceptions in application_controller into this module
  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   json_response({ message: exception.message }, :not_found)
  # end

  # rescue_from ActiveRecord::RecordInvalid do |exception|
  #   json_response({ message: exception.message }, :unprocessable_entity)
  # end
end