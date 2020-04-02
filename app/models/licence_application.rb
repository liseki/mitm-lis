class LicenceApplication < ActiveRecord::Base
	
	belongs_to				:category, :counter_cache => true
	belongs_to				:user
	belongs_to				:licence
	has_one					:attachment, :dependent => true
	belongs_to				:company
					
	attr_accessor			:main_category, :sub_category1, :sub_category2, :sub_category3, :sub_category4, 
							:sub_category5, :sub_category6, :sub_category7, :sub_category8, :sub_category9, :sub_category10
	attr_accessible			:signed, :subsidiary, :main_category, :principal_licence, :sub_category1, :sub_category2, :sub_category3, 
							:sub_category4, :sub_category5, :sub_category6, :sub_category7, :sub_category8, :sub_category9, 
							:sub_category10
	
	
	def validate
		if subsidiary
			unless principal_licence =~ /\A\d{1,15}\Z/ && principal_licence.to_i > 0
				errors.add(:principal_licence, "Principal licence number is blank or invalid.")
			end
			if principal_licence.to_i > 0
                        if Licence.find_by_temp_number(principal_licence)
                              errors.add(:principle_licence, "That principal licence number is temporary.")
                        else
                              unless Licence.find_by_perm_number(principal_licence)
                                    errors.add(:principle_licence, "That principal licence number does not exist.")
                              end
                        end
			end
		end
	end
	
	
	def ref
		self.id.to_s.rjust(7, '0').insert(-7, '-').insert(-4, '-')
	end
      
	
	def self.find_by_ref(ref)
		LicenceApplication.find(ref.delete('-').to_i)
	end
	
      
      def signature
           self.signed ? "Yes" : "No" 
	end     
     
     
	def setup_categories(categories)
		self.main_category = categories[0]
		self.sub_category1 = categories[1].nil? ? nil : categories[1]
		self.sub_category2 = categories[2].nil? ? nil : categories[2]
		self.sub_category3 = categories[3].nil? ? nil : categories[3]
		self.sub_category4 = categories[4].nil? ? nil : categories[4]
		self.sub_category5 = categories[5].nil? ? nil : categories[5]
		self.sub_category6 = categories[6].nil? ? nil : categories[6]
		self.sub_category7 = categories[7].nil? ? nil : categories[7]
		self.sub_category8 = categories[8].nil? ? nil : categories[8]
		self.sub_category9 = categories[9].nil? ? nil : categories[9]
		self.sub_category10 = categories[10].nil? ? nil : categories[10]
	end
     
end
