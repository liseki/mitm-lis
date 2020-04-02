class Address < ActiveRecord::Base
	
      belongs_to                    	      :company
	belongs_to					:ward
	
	attr_accessor				:region, :district, :box, :phone, :fax_no
	attr_accessible				:p_o_box, :telelphone, :fax, :plot_no, :block, :house_no, :street, :email, :region, :district, :ward_id, 
								:box, :phone, :fax_no
	
      validates_format_of			:p_o_box,
								:with => /\A[\d\s]{0,10}\Z/,
								:message => "Post Office is invalid or too long."
	validates_format_of			:telephone,
								:with => /\A[\d\s\+]{0,15}\Z/,
								:message => "Telephone is invalid or too long."
	validates_format_of			:fax,
								:with => /\A[\d\s\+]{0,15}\Z/,
								:message => "Fax is invalid or too long."							
	validates_format_of			:plot_no,
								:with => /\A[\w\s-]{0,10}\Z/,
								:message => "Plot # contains invalid characters or is too long."
	validates_format_of			:block,
								:with => /\A[\w\s-]{0,10}\Z/,
								:message => "Block contains invalid characters or is too long."
	validates_format_of			:house_no,
								:with => /\A[\w\s-]{0,10}\Z/,
								:message => "House # contains special characters or is too long."							
	validates_format_of			:street,
								:with => /\A[\w\s,.:;()'&\-\/]{0,50}\Z/,
								:message => "Street is either blank, includes special characters or too long."
	validates_format_of			:email,
								:with => /\A[-_.@\w]{0,50}\Z/,
								:message => "Email is either blank, incomplete, includes special characters or too long."
	validates_format_of			:ward_id,
								:with => /\A[1-9]{1}\d+\Z/,
								:message => "Ward is not selected."
								
	def before_validation
		self.p_o_box = self.box.gsub(/\s/, '')
		self.telephone = self.phone.gsub(/\s/, '')
		self.fax = self.fax_no.gsub(/\s/, '')
	end

end
