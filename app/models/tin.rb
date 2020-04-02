class Tin < ActiveRecord::Base
	
	belongs_to					:company
	
	attr_accessor				:subsidiary
	attr_accessible				:tin_number, :subsidiary

	
	def validate
		if tin_number == "" || tin_number.to_i == 0
			errors.add(:tin_number, "TIN is blank.")
		else
			if tin_number =~ /\A\d{9}\Z/
				tin = Tin.find_by_tin_number(tin_number)
				if tin
					if !subsidiary
						if tin.id != self.id: errors.add(:tin_number, "That TIN is already in use.") end						
					end
				end
			else
				errors.add(:tin_number, "TIN is either not a number or not the standard 9 digits.")
			end
		end
	end
	
	
	def before_validation
		self.tin_number = self.tin_number.delete("-").delete(" ")
	end
	
	
	def ti_num
		self.tin_number.to_s.insert(-7, '-').insert(-4, '-')
	end
	
end
