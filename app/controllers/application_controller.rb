class ApplicationController < ActionController::API
 rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


private
def render_not_found_response(execption)
	render json: { error: "#{execption.model} not found" }, status: :not_found
end

def render_unprocessable_entity_response(execption)
	render json: {errors: execption.record.errors.full_messages}, status: :unprocessable_entity
end

end
