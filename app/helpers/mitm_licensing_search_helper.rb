module MitmLicensingSearchHelper

	def search_title
		count = @report == 1 ? @applications.size : @count
		entity = case @app_lic
					when "a" then " Unprocessed Application"
					when "t" then " Temporary Licence"
					when "p" then " Permanent Licence"
				end
		entity = count.to_s + entity
		entity = entity + "s" if count > 1		
		entity = entity + " under "
		
		criteria = case @element
					when 1 then "Company  "
					when 2 then "TIN "
					when 3 then "Certificate of Incorporation # or Registration # "
					when 4 then "Director "
				end
				
		return entity + criteria + "'" + @input + "'"
	end
	
	
	def search_title1
		count = @report == 1 ? @applications.size : @count
		entity = case @app_lic
					when "a" then " Unprocessed Application"
					when "t" then " Temporary Licence"
					when "p" then " Permanent Licence"
				end
		entity = count.to_s + entity
		entity = entity + "s" if count > 1
		entity = entity + " with"
		
		if @id.scan(/\|/).size <= 1
			dump = case @app_lic
						when "a" then " reference number " + @id
						else " licence number " + @id
					end
			entity = entity + dump
		elsif @id.scan(/\|/).size > 1
			dump = case @app_lic
						when "a" then " reference numbers " + @id.gsub(/\|/, ", ")
						else " licence numbers " + @id.gsub(/\|/, ", ")
					end
			entity = entity + dump
		end
		return entity
	end
	
	
	def search_title2
		count = @report == 1 ? @applications.size : @count
		entity = case @app_lic
					when "a" then " Unprocessed Application"
					when "t" then " Temporary Licence"
					when "p" then " Permanent Licence"
				end
		entity = count.to_s + entity
		entity = entity + "s" if count > 1
		
		dump = 	case @app_lic
					when "a" then " made "
					else " issued "
				end
		entity = entity + dump
		
		dump2 = case @date2 - @date1
					when 1 then "on " + time_date_2(@date1)
					else "between " + time_date_2(@date1) + " and " + time_date_2(@date2 - 1)
				end
		entity = entity + dump2
		
		dump7 = 	case @app_lic
					when "a" then " by "
					else " to "
				end
		entity = entity + dump7			
		
		dump3 = case @i
					when "loc" then "Local "
					when "jnt" then "Jointly Owned "
					when "for" then "Foreign "
					else ""
				end
		entity = entity + dump3
		
		dump4 = case @b
					when "ltd" then "Limited Companies "
					when "cmp" then "Proprietorships "
					when "ind" then "Individuals "
					else "Businesses "
				end
		entity = entity + dump4
		
		if @cat == 0: dump5 = "in all sectors "
		else dump5 = "in " + Category.find(@cat).name + " " end
		entity = entity + dump5
		
		if @dis > 0: 
			dump6 = "in " + District.find(@dis).name + ", " + Region.find(@reg).name
		else
			if @reg == 0
				dump6 = "in Tanzania"
			else
				dump6 = "in " + Region.find(@reg).name
			end
		end
		entity = entity + dump6
	end
	
	
	def search_title3
		count = @report == 1 ? @applications.size : @count
		entity = case @app_lic
					when "a" then " Unprocessed Application"
					when "t" then " Temporary Licence"
					when "p" then " Permanent Licence"
				end
		entity = count.to_s + entity
		entity = entity + "s" if count > 1		
		
		dump = 	case @app_lic
					when "a" then " made "
					else " issued "
				end
		entity = entity + dump
		
		dump2 = case @date2 - @date1
					when 1 then "on " + time_date_2(@date1)
					else "between " + time_date_2(@date1) + " and " + time_date_2(@date2 - 1)
				end
		entity = entity + dump2
		
		dump7 = 	case @app_lic
					when "a" then " by "
					else " to "
				end
		entity = entity + dump7	
		
		dump4 = case @i
					when "loc" then "Locally Owned "
					when "jnt" then "Jointly Owned "
					when "for" then "Foreign Owned "
					else "" end
		entity = entity + dump4 + Country.find(@cty).name + " companies "

		if @cat == 0: dump5 = "in all sectors "
		else dump5 = "in " + Category.find(@cat).name + " " end
		entity = entity + dump5
		
		if @dis > 0: 
			dump6 = "in " + District.find(@dis).name + ", " + Region.find(@reg).name
		else
			if @reg == 0
				dump6 = "in Tanzania"
			else
				dump6 = "in " + Region.find(@reg).name
			end
		end
		entity = entity + dump6
	end
	
	
	def show_shareholders(company)
		shareholders = company.shareholders
		shareholders.collect! {|country_id| Country.find_by_id(country_id).name}
		shareholders.join(', ')
	end
	
end
