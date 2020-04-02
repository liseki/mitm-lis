class Attachment < ActiveRecord::Base
	
	belongs_to				:licence_application
	
	attr_accessible			:cert_inc_or_reg, :memorandum, :tz_proof, :att_powers, :premises, :tin_cert, :cal, :tal, 
							:prof_cert, :air_sea_worth, :other
	
	
	validates_format_of          :other,
							:with => /\A[\w\s,.:;()'&\-\/]{0,}\Z/,
							:message => "Other attachments includes unrecognised characters."		
	
end
