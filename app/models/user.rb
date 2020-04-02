require "digest/sha1"

class User < ActiveRecord::Base
	
	has_many					:licence_applications
	has_many					:licences
	
	attr_accessor				:password, :password_confirmation, :email_confirmation
	
	validates_presence_of		:email 
      validates_uniqueness_of          :email,
                                                :message => "is already in use."
	validates_confirmation_of     	:email, :password
      validates_format_of          	:first_name, :surname,
								:with => /\A[a-zA-Z\s-]+\Z/,
								:message => "can't be blank or more than 20 letters."
	validates_length_of			:first_name, :surname,
								:maximum => 20,
								:message => "is too long."
	validates_format_of			:password,
								:with => /\A\w+\Z/,
								:message => "should not include special characters."							
	validates_length_of			:password,
								:minimum => 6,
								:message => "is either blank or too short."
	
	USER_TYPE = [["read only", -1], ["normal", 0], ["administrator", 1]].freeze
	
	
	def before_create
		self.pword = User.pword(self.password)
	end	
	
	
	def after_create
		@password = @password_confirmation = nil
	end
	
	
	def try_to_login
		User.login(self.email, self.password)
	end
	
	
	def self.login(email, password)
		pword = pword(password || "")
		find(:first,
			:conditions => ["email = ? and pword = ?", email, pword])
	end
	

	def name
		self.first_name.capitalize + " " + self.surname.capitalize
	end
	
	
	def type
		if self.user_type == -1: return "read only"
		elsif self.user_type == 0: return "normal"
		elsif self.user_type == 1: return "administrator" end
	end
		
	
	private
	
	def self.pword (password)
		Digest::SHA1.hexdigest(password)
	end
	
end
