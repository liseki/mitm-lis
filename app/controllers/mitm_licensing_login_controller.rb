class MitmLicensingLoginController < ApplicationController

	layout 'mitm_login', :only => [:login]
	
	def login
		logout = params[:logout].nil? ? 'no' : params[:logout]
		flash[:notice] = logout == 'done' ? "...logged out!" : "...please log in" 
		session[:mitm_user_id] = nil
		session[:mitm_user_type] = nil
		@user = User.new
	end
	
	
	def attempt_login
		@user = User.new(params[:user])
		logged_in_user = @user.try_to_login
		if logged_in_user
			session[:mitm_user_id] = logged_in_user.id
			session[:mitm_user_type] = logged_in_user.user_type
			render :template => "/mitm_licensing_login/logged_in"
		else
			flash[:notice] = "...invalid email /password combination"
			render :template => "/mitm_licensing_login/invalid_login"
		end
	end
	
	
	def logout
		redirect_to :action =>"login",  :logout => 'done'
	end
	
end
