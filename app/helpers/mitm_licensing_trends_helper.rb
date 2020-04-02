module MitmLicensingTrendsHelper

	def trend_title
		count = @category_distribution[0].nil? ? 0 : @category_distribution[0]
            
		entity = case @app_lic
					when "t" then " Temporary Licence"
					when "p" then " Permanent Licence"
				end
		entity = count.to_s + entity
		entity = entity + "s" if count != 1
		entity = entity + " issued "
		
		dump2 = case @start_date - @end_date
					when 0 then "on " + time_date_2(@start_date)
					else "between " + time_date_2(@start_date) + " and " + time_date_2(@end_date)
				end
		entity = entity + dump2
		
		entity = entity + " to "
		
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


	def trend_title2
		count = @category_distribution[0].nil? ? 0 : @category_distribution[0]
            
		entity = case @app_lic
					when "t" then " Temporary Licence"
					when "p" then " Permanent Licence"
				end
		entity = count.to_s + entity
		entity = entity + "s" if count != 1
		entity = entity + " issued "
		
		dump2 = case @start_date - @end_date
					when 0 then "on " + time_date_2(@start_date)
					else "between " + time_date_2(@start_date) + " and " + time_date_2(@end_date)
				end
		entity = entity + dump2
		
		entity = entity + " to "
		
		dump3 = case @i
					when "loc" then "Locally Owned "
					when "jnt" then "Jointly Owned "
					when "for" then "Foreign Owned "
					else ""
				end
		entity = entity + dump3 + Country.find(@cty).name + " companies "

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
end