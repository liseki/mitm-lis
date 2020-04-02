class Licence < ActiveRecord::Base
	
	belongs_to					:category, :counter_cache => true
	belongs_to					:user
      has_one                         	:licence_application
	
	attr_accessor				:skip_temp, :temp_number_confirmation, :perm_number_confirmation, :old_number
	attr_accessible				:temp_number, :perm_number, :temp_number_confirmation, :perm_number_confirmation
	
	
      def validate
		if skip_temp == 1
			if perm_number.to_i == 0
				errors.add(:perm_number, "Licence number is blank.")
			else
				unless perm_number =~ /\A\d{1,15}\Z/
					errors.add(:perm_number, "Licence number is not a number or too long.")
				else
					if Licence.find_by_temp_number(perm_number) || Licence.find_by_perm_number(perm_number)
						if perm_number != old_number
							errors.add(:perm_number, "That licence number is already in use.")
						end
					elsif perm_number != perm_number_confirmation
						errors.add(:perm_number, "That licence number does not match its confirmation.")
					end
				end
			end   
		else
			if temp_number.to_i == 0
				errors.add(:temp_number, "Licence number is blank.")
			else
				unless temp_number =~ /\A\d{1,15}\Z/ 
					errors.add(:temp_number, "Licence number is not a number or too long.")
				else
					if Licence.find_by_temp_number(temp_number) || Licence.find_by_perm_number(temp_number)
						if temp_number != old_number
							errors.add(:temp_number, "That licence number is already in use.")
						end
					elsif temp_number != temp_number_confirmation
						errors.add(:temp_number, "That licence number does not match its confirmation.")
					end
				end
			end   
		end	
	end	
            
	
	def issue_temp
		self.licence_type = "t"
	end
	
	
	def issue_perm
		self.licence_type = "p"
	end
	
end
