class MitmLicensingTrendsController < ApplicationController
	
	require 'gruff'
	layout 'mitm',		:only => [:index]
	
	
	def index
		@search = Search.new
		@main_categories = Category.find_by_name("Schedule A").children
	end
	
	
	def trends_function
		@option = params[:option].to_i
		@main_categories = Category.find_by_name("Schedule A").children
	end
	
	
	def search
		@app_lic = params[:search].nil? ? params[:app_lic] : params[:search][:lic_or_app3]
		@i = params[:search].nil? ? params[:i_type] : params[:search][:investment_type]
		@cat = params[:search].nil? ? params[:cat].to_i : get_category_id
		@reg = params[:search].nil? ? params[:reg].to_i : params[:address][:region].to_i
		@dis = params[:search].nil? ? params[:dis].to_i : params[:address][:district].to_i
		@start_date, @end_date = params[:search].nil? ? get_report_dates : get_dates
		@option = params[:option].to_i
		@range = get_range
		
		if @option == 1: @b = params[:search].nil? ? params[:b_type] : params[:search][:business_type]
		elsif @option == 2: @cty = params[:search].nil? ? params[:cty].to_i : params[:search][:country].to_i end
		
		@category_distribution = []
		cat_id = get_categories(@cat)
		dis = @dis == 0 ? "%" : @dis.to_s
		@results = Array.new(@range.size)
		
		date = case @app_lic
					when "a" then "app_date"
					when "t" then "temp_issue_date"
					when "p" then "perm_issue_date" end
					
		if @option == 1
			view = "region" + @reg.to_s + @app_lic
			for i in 0..@range.size - 1 
				date1 = @range[i-1]; date2 = @range[i]
				date2 += check_date(date2)
				@results[i] = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and business_type ILIKE ? and investment_type ILIKE ? 
					and district_id ILIKE ? and category_id SIMILAR TO ?", date1, date2, @b, @i, dis, cat_id])
			end
				
			applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and business_type ILIKE ? and investment_type ILIKE ? 
					and district_id ILIKE ? and category_id SIMILAR TO ?", @start_date, @end_date+1, @b, @i, dis, cat_id])
		elsif @option == 2
			view = "countries0" + @app_lic
			reg = @reg == 0 ? "%" : @reg.to_s
			for i in 0..@range.size - 1 
				date1 = @range[i-1]; date2 = @range[i]
				date2 += check_date(date2)
				@results[i] = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and region_id ILIKE ? and district_id ILIKE ? 
					and category_id SIMILAR TO ? and country_id = ? and investment_type ILIKE ?", 
					date1, date2, reg, dis, cat_id, @cty, @i])
			end
				
			applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and region_id ILIKE ? and district_id ILIKE ? 
					and category_id SIMILAR TO ? and country_id = ? and investment_type ILIKE ? OFFSET ? LIMIT ?", 
					@start_date, @end_date+1, reg, dis, cat_id, @cty, @i, @offset, @per_page])	
		end
		
		sort_applications(applications)
		@category_distribution[0] = get_total_count
		if params[:report].to_i == 1
			@graph_option = params[:graph][:graph_option].to_i
			render :template => '/mitm_licensing_trends/report', :layout => 'report'
		else
			draw_graph
			render :template => '/mitm_licensing_trends/search_results'
		end
	end
	
	
	private
	
	
	def get_categories(cat)
		begin
			root = Category.find(cat)
			categories = []; category_ids = ""
			if root.categories_count > 0
				categories = root.children
				i = 0
				while i >= 0
					if categories[i].categories_count > 0
						for j in 0...categories[i].categories_count
							categories.insert(i+1+j, categories[i].children[j])
						end
					end
					i += 1
					break if i > categories.size - 1
				end
			else
				categories = [root]
			end
			categories.each {|category| category_ids += category.id.to_s + "|"}
			category_ids = category_ids.chop
			return category_ids
		rescue ActiveRecord::RecordNotFound
			return "%"
		end
	end	
	
	
	def get_category_id
		if params[:licence_application][:main_category].to_i > 0
			categories = Array.new(11)
			categories[0] = params[:licence_application][:main_category].to_i
			1.upto(10) {|i| categories[i] = params[:licence_application]["sub_category" + i.to_s].to_i}
			categories.delete_if {|i| i == 0}
			return categories[categories.size - 1]
		else
			return 0
		end
	end	
	
	
	# Fetch the two date variables set by the user in the submitted form.
	def get_dates
		date1 = Date.new(params[:range1][:year].to_i, params[:range1][:month].to_i, params[:range1][:day].to_i)
		date2 = Date.new(params[:range2][:year].to_i, params[:range2][:month].to_i, params[:range2][:day].to_i)
		return date1, date2
	end
	
	
	def get_report_dates
		re = /(\d+)-(\d+)-(\d+)/
		start_date = re.match(params[:start_date])
		end_date = re.match(params[:end_date])
		date1 = Date.new(start_date[1].to_i, start_date[2].to_i, start_date[3].to_i)
		date2 = Date.new(end_date[1].to_i, end_date[2].to_i, end_date[3].to_i)
		return date1, date2
	end
	
	
	# Generate a step-thru range of dates based on the two dates set by the user.
	# A complete range has three dates in between the two dates set by the user.
	def get_range
		range = []
		range[0] = @start_date
		days_diff = (@end_date - @start_date).to_i
		if days_diff == 0
			range[1] = @start_date+1
		elsif days_diff <= 4
			1.upto(days_diff) {|i| range[i] = @start_date + i}
		elsif days_diff%4 == 0
			day_count = days_diff/4
			1.upto(4) {|i| range[i] = @start_date + (day_count * i)}
		else
			day_count = days_diff/4
			day_remain = days_diff%4
			1.upto(4) {|i| range[i] = @start_date + (day_count * i) + distribute_remainder(i, day_remain)}
		end
		return range
	end
	
	
	def distribute_remainder(i, day_remain)
		case day_remain
			when 1
				case i
					when 1 then 0
					when 2 then 0
					when 3 then 1
					when 4 then 1
				end
			when 2
				case i
					when 1 then 0
					when 2 then 1
					when 3 then 2
					when 4 then 2
				end
			when 3
				case i
					when 1 then 1
					when 2 then 2
					when 3 then 3
					when 4 then 3
				end
		end
	end
	
	
	def perform_search
		@category_distribution = []
		if @business_type == "___" && @investment_type != "___"
			search_1
			@graph_num = 1
		elsif @business_type != "___" && @investment_type == "___"
			search_2
			@graph_num = 2
		elsif @business_type == "___" && @investment_type == "___"
			search_3
                  @graph_num = 3
		else
			search_4
			@graph_num = 4
		end
		draw_graph(@graph_num)
		draw_graph_2 if @graph_num == 3
		#render :template => '/mitm_licensing_trends/search_results'
	end	
	
	
	def check_date(date2)
		if date2 == @range[@range.size - 1]
			return 1
		else
			return 0
		end
	end
	
	
	def sort_applications(applications)
		for application in applications
			if @category_distribution[application.category_id].nil?
				@category_distribution[application.category_id] = 1
			else
				@category_distribution[application.category_id] += 1
			end
		end
	end
	
	
	def get_total_count
		@category_distribution.each_index {|i| @category_distribution[i] = 0 if @category_distribution[i].nil?}
		count = @category_distribution.inject {|sum, element| sum + element}
	end
	
	
	def get_category_number(application)
		category = application.category
		root = Category.find_by_name("Schedule A")
		if category.parent.id != root.id
			category = category.parent
			while true
				if category.parent.id == root.id
					break
				else
					category = category.parent
				end
			end
		end
		return category.id
	end
	
	
	def draw_graph
		graph = Gruff::Line.new('680x350')
		graph.theme_37signals
		
		category = @app_lic == "t" ? "Temporary Licences" : "Permanent Licences"
		graph.data(category, @results, multi_line_graph_colour(0))
		
		graph.labels = case @range.size
						when 2 then {0 => date_label(@range[0]), 1 => date_label(@range[0])}
						when 3 then {0 => date_label(@range[0]), 1 => date_label(@range[1]), 2 => date_label(@range[2])}
						when 4 then {0 => date_label(@range[0]), 1 => date_label(@range[1]), 2 => date_label(@range[2]), 
										3 => date_label(@range[3])}
						when 5 then {0 => date_label(@range[0]), 1 => date_label(@range[1]), 2 => date_label(@range[2]), 
										3 => date_label(@range[3]), 4 => date_label(@range[4])}
						end
		filename = 'public/images/graphs/mitm_graph_' + generate_file_name + '.png'
		graph.write(filename)
		session[:graph1] = filename.gsub(/public\/images\//, '')
	end
	
	
	def multi_line_graph_colour(i)
		case i
			when 0 then '#0000ff'
			when 1 then '#00ff00'
			when 2 then '#ff0000'
			when 3 then '#999999'
		end
	end
	
	
	def date_label(date)
		return date.day.to_s + "/" + date.month.to_s + "/"  + date.year.to_s.gsub(/\A\d\d/, '')
	end
	
	
	def generate_file_name
		chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
		file_name = ""
		1.upto(8) { |i| file_name << chars[rand(chars.size - 1)] }
		return file_name
	end
end