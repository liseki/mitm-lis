class Category < ActiveRecord::Base
	
	acts_as_tree				:order => "name", :counter_cache => true
	has_many				:licence_applications
	has_many				:licences
	
	attr_accessor			:category_id
	attr_accessible			:name, :parent_id
  
	validates_uniqueness_of	:name,
							:message => "already exists."
	validates_format_of		:name,
							:with => /\A(\w)([\w\s,.:;'&\-\/]+)\Z/,
							:message => "is blank or invalid."
	validates_length_of		:name,
							:maximum => 70,
							:message => "is too long."
							
end
