class Country < ActiveRecord::Base
	
	has_and_belongs_to_many		:business_holdings, :class_name => "Company"
	
end
