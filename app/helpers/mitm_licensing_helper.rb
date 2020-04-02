module MitmLicensingHelper

	def error_count(count)
		if count == 1
			return 1
		elsif count == 2
			return @application.errors.size
		elsif count == 3
			return @company.errors.size
		elsif count == 4
			return @director.errors.size
		elsif count == 5
			return @tin.errors.size
		elsif count == 6
			return @address.errors.size
		else
			return 0
		end
	end
	
	
	def show_shareholders
		shareholders = @application.nil? ? @company.shareholders : @application.company.shareholders
		shareholders.collect! {|country_id| Country.find_by_id(country_id).name}
		shareholders.join(', ')
	end
	
	
	def to_60_days(date_string)
		re = /(\d{4})-(\d{2})-(\d{2})/
		md = re.match(date_string)
		issued = Date.new(md[1].to_i, md[2].to_i, md[3].to_i)
		days_remaining = 60 - (Date.today - issued).to_i
		
		case 
		when days_remaining >= 30
			"<span class='30_or_more'>#{days_remaining}</span>"
		when days_remaining < 30 && days_remaining >= 15
			"<span class='15_or_more'>#{days_remaining}</span>"
		when days_remaining < 15 && days_remaining >= 7
			"<span class='7_or_more'>#{days_remaining} <span class='almost_due'>*</span></span>"
		when days_remaining < 7 && days_remaining >= 1
			"<span class='1_or_more'>#{days_remaining} <span class='almost_due'>**</span></span>"
		when days_remaining == 0
			"<span class='today'>today ***</span>"
		when days_remaining < 0
			"<span class='over_due'>+#{days_remaining.abs} ***</span>"
		end
	end
	
end
