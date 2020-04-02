class Company < ActiveRecord::Base

      acts_as_tree				      :order => "name", :counter_cache => true
	has_many					:licence_applications, :dependent => true
	has_and_belongs_to_many	:shareholders, :class_name => "Country"
	has_one						:tin, :dependent => true
	has_many					:directors, :dependent => true
	has_one						:address, :dependent => true
	
	attr_accessor				:inc_no, :reg_no, :no_of_shareholders, :holder1, :holder2, :holder3, :holder4, :holder5, :holder6, 
								:holder7, :holder8, :holder9, :holder10, :holders, :subsidiary
	attr_accessible    			:name, :business_type, :inc_no, :reg_no, :no_of_shareholders, :holder1, :holder2, :holder3, :holder4, 
								:holder5, :holder6, :holder7, :holder8, :holder9, :holder10, :holders, :inc_or_reg_no
								
      validates_format_of          	:name,
								:with => /\A[\w\s,.:;()'&\-\/]+\Z/,
								:message => "Company/Applicant name includes invalid characters."								
	validates_length_of			:name,
								:maximum => 200,
								:message => "Company/Applicant name is too long."
	validates_inclusion_of			:business_type,
								:in => %w{ ltd cmp ind },
								:message => "Business entity is not selected."
	validates_inclusion_of			:investment_type,
								:in => %w{ loc for jnt },
								:message => "Shareholders's Citizenship is blank."	

	
	def before_validation
		self.inc_or_reg_no = case self.business_type
								when "ltd" then self.inc_no
								when "cmp" then self.reg_no
								when "ind" then ""
							end
		self.holders = get_shareholders
		self.investment_type = get_investment_type
	end
	
	
	def validate
		if business_type == "ltd" || business_type =="cmp"
			if inc_or_reg_no.to_i == 0
				errors.add(:inc_or_reg_no, "is blank.")	
			elsif inc_or_reg_no !~ /^\d+$/
				errors.add(:inc_or_reg_no, "is not a number.")
			else
				company = Company.find_by_inc_or_reg_no(inc_or_reg_no)
				if company
					if company.id != self.id && !subsidiary && company.business_type != business_type
						errors.add(:inc_or_reg_no, "already exists!")
					end
				end
			end
		end
	end
	
	
	def business
		case self.business_type
			when "ltd" then "Limited Company"
			when "cmp" then "Proprietorship"
			when "ind" then "Individual"
		end
	end
	
	
	def investment
		if self.investment_type == "loc" then "Local"
		elsif self.investment_type == "for" then "Foreign"
		elsif self.investment_type == "jnt" then "Joint Venture" end
	end
	
	
	def show_directors
		company_directors = ""
		self.directors.each do |director|
			company_directors << director.name + " & "
		end
		company_directors = company_directors.gsub(/\s&\s\Z/, '')
	end
	
	
	def setup_shareholders
		self.no_of_shareholders = self.shareholders.size
		self.holder1 = self.shareholders[0].nil? ? nil : self.shareholders[0].id
		self.holder2 = self.shareholders[1].nil? ? nil : self.shareholders[1].id
		self.holder3 = self.shareholders[2].nil? ? nil : self.shareholders[2].id
		self.holder4 = self.shareholders[3].nil? ? nil : self.shareholders[3].id
		self.holder5 = self.shareholders[4].nil? ? nil : self.shareholders[4].id
		self.holder6 = self.shareholders[5].nil? ? nil : self.shareholders[5].id
		self.holder7 = self.shareholders[6].nil? ? nil : self.shareholders[6].id
		self.holder8 = self.shareholders[7].nil? ? nil : self.shareholders[7].id
		self.holder9 = self.shareholders[8].nil? ? nil : self.shareholders[8].id
		self.holder10 = self.shareholders[9].nil? ? nil : self.shareholders[9].id
	end
      
      
      def got_perm_licences
            check = 0
            self.licence_applications.each do |application| 
                  if application.processed 
				if application.licence.licence_type == "p" 
					check = 1 
				end 
			end
            end
            return check
      end
	
	
	private
	
	def get_shareholders
		holders = Array.new(10)
		holders = [self.holder1, self.holder2, self.holder3, self.holder4, self.holder5, self.holder6, 
					self.holder7, self.holder8, self.holder9, self.holder10].compact
		holders.collect! {|holder| holder.to_i}
		holders = holders.uniq
		holders.delete_if {|holder| holder == 0}
	end
	
	
	def get_investment_type
		if self.holders.size == 1
			if self.holders.include?(213)
				return "loc"
			else
				return "for"
			end
		elsif self.holders.size > 1
			if self.holders.include?(213)
				return "jnt"
			else
				return "for"
			end
		end
	end
	
end
