class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action do
		resource = controller_name.singularize.to_sym
		method = "#{resource}_params"
		params[resource] &&= send(method) if respond_to?(method, true)
	end
end
