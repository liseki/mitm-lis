# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
	
	before_filter 			          :authorize, :except => [:login, :attempt_login]
	helper					    :time_date_format
  
	def authorize
		unless session[:mitm_user_id] && session[:mitm_user_type]
			redirect_to(:controller => "mitm_licensing_login", :action => "login")
		end
	end
	
	
	def rescue_404
		rescue_action_in_public CustomNotFoundError.new
	end


	def rescue_action_in_public(exception)
		case exception
			when CustomNotFoundError, ::ActionController::UnknownAction then
			#render_with_layout "shared/error404", 404, "standard"
			render :template => "/shared/404", :layout => "mitm", :status => "404"
		else
			@message = exception
			render :template => "/shared/500", :layout => "mitm", :status => "500"
		end
	end


	def local_request?
		return false
	end
	
	class CustomNotFoundError < Exception	
	end
  
end