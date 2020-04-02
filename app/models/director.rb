class Director < ActiveRecord::Base
	
	belongs_to					:company
	
	attr_accessor				:names, :names_holder
	attr_accessible				:name, :names, :names_holder
	
	

	def validate
		if names =~ /\A\w[\w\s&.-]+\Z/
			self.names_holder = Array.new
			director_names = names + " &"
			if director_names.scan(/&/).size <= 10
				re = /(\w[\w\s.-]+[\w.])\s*&\s*/
				while !director_names.nil?
					md = re.match(director_names)
					director_names = $'
					unless md.nil?
						if md[1].size > 50: errors.add(:name, "Director name is too long.")
							unless md[1] =~ /\A\w[\w\s.-]+\Z/: errors.add(:name, "Director name " + md[1] + " is invalid.") end
						elsif md[1].size <= 50 && md[1] =~ /\A\w[\w\s.-]+\Z/: self.names_holder << md[1]
						else errors.add(:name, "Director name " + md[1] + " is invalid.")
						end
					end
				end
			else
				errors.add(:name, "Too many directors. Maintain the number at 10 or less.")
			end
		elsif names == "": errors.add(:name, "Director name is blank.")
		else errors.add(:name, "Director name is invalid. For multiple names, separate them with an &. Eg Amani & Juma & Alan")
		end
	end
end
