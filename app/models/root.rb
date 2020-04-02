class Root < ActiveRecord::Base
	
	attr_accessor		:password, :new_password, :new_password_confirmation
	attr_accessible		:password, :new_password, :new_password_confirmation
	
	validates_confirmation_of		:new_password
	validates_presence_of		:password, :new_password
	validates_format_of			:new_password,
								:with => /\A\w+\Z/,
								:message => "should not include special characters.",
								:if => Proc.new { |mod| !mod.new_password.blank? }
	validates_length_of			:new_password,
								:in => 6..16,
								:too_short => "is too short. Make it atleast 6 chatacters long.",
								:too_long => "is too long. Make it atmost 16 characters long.",
								:if => Proc.new { |mod| !mod.new_password.blank? }
	
end
