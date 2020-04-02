class MitmLicensingSearchController < ApplicationController
	
	layout 'mitm',		:only => [:index]
	
	
	def index
		@search = Search.new
	end
	
	
	def search_function
		@main_categories = Category.find_by_name("Schedule A").children
		@option = params[:option].to_i
	end
	
	
	def search
		@search = Search.new
		@option = params[:option].to_i
		@page = params[:page].nil? ? 1 : params[:page].to_i
		@per_page = 10
		@offset = (@page -1) * @per_page
		if @option == 1: search_one
		elsif @option == 2: search_two
		elsif @option == 3: search_three
		elsif @option == 4: search_four end		
	end
	
	
	def search_results_report
		@report_option = params[:report][:search_report].to_i
		@option = params[:option].to_i
		@report = 1
		if @option == 1: search_one
		elsif @option == 2
			@app_lic = params[:app_lic]
			@element = params[:element].to_i
			@input = params[:input]
			if @option == 2
				if @element == 1 					#company name
					search_company(@input)
				elsif @element == 2					#TIN
					search_tin(@input)
				elsif @element == 3					#inc or reg number
					search_inc_or_reg(@input)
				elsif @element == 4					#director name
					search_director(@input)
				end
			end
		elsif @option == 3: search_three
		elsif @option == 4: search_four end
	end
	
	
	def reset_search
		render :template => '/mitm_licensing_search/reset_form'
	end
		
		
	def setup_districts
            if params[:reg_id].to_i > 0
                  @districts = District.find(:all, :conditions => ["region_id = ?", params[:reg_id].to_i])
                  render :template => '/mitm_licensing_search/setup_districts'
            elsif params[:reg_id].to_i == 0
                  render :template => '/mitm_licensing_search/hide_districts_and_wards'
            end
      end
      
      
      def setup_wards
            if params[:dis_id].to_i > 0
                  @wards = Ward.find(:all, :conditions => ["district_id = ?", params[:dis_id].to_i])
                  render :template => '/mitm_licensing_search/setup_wards'
            elsif params[:dis_id].to_i == 0
                  render :template => '/mitm_licensing_search/hide_wards'
            end
      end
	
	
	def show_sub_categories
		if params[:main_cat_id].to_i > 0
			category = Category.find(params[:main_cat_id].to_i)
			@num = category.ancestors.size
			if category.children.size > 0
				@sub_categories = category.children
				render :template => '/mitm_licensing_search/show_sub_categories'
			else
				render :template => '/mitm_licensing_search/hide_sub_categories'
			end
		elsif params[:main_cat_id].to_i == 0
			@num = 1
			render :template => '/mitm_licensing_search/hide_sub_categories'
		end
	end
	
	
	def change_country_options
		if params[:country_id].to_i == 213
			render :template => '/mitm_licensing_search/country_options'
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
	
	
	def search_one
		@app_lic = params[:search].nil? ? params[:app_lic] : params[:search][:lic_or_app1]
		if !params[:search].nil?: @id, error_count = get_ids(params[:search][:input1].delete('-'))
		else @id = params[:id] end
		
		if !params[:search].nil? && error_count == 0 || !params[:id].nil?
			view = "region0" + @app_lic
			ref = case @app_lic
					when "a" then "id"
					when "t" then "temp_number"
					when "p" then "perm_number" end
					
			if @report == 1
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view} WHERE #{ref} SIMILAR TO ?", @id])
			else
				@count = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}	WHERE #{ref} SIMILAR TO ?", @id])
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE #{ref} SIMILAR TO ? OFFSET ? LIMIT ?", @id, @offset, @per_page])
			end
			
			if @report == 1
				@sorted_applications = sort_companies(@applications) if @report_option == 2
				render :template => '/mitm_licensing_search/search_results_report', :layout => 'report'
			else
				@applications_pages = Paginator.new(self, @count, @per_page, @page)
				render :template => '/mitm_licensing_search/search_result1' if @applications.size > 0
				render :template => '/mitm_licensing_search/no_result' if @applications.size == 0		
			end
		else
			render :template => '/mitm_licensing_search/invalid_search_result1'
		end
	end
	
	
	def get_ids(user_input)
		clean_input = ""; error_count = 0
		input = user_input + " &"
		1.upto(input.scan(/&/).size) do |i|
			re = /(\d+)\s*&\s*/
			if !input.nil?
				md = re.match(input)
				input = $'
				unless md.nil?
					if md[1] =~ /\A[\d]+\Z/
						if md[1].to_i > 0
							clean_input << md[1] + "|"
						else error_count += 1 end
					else error_count += 1 end						
				end
			end
		end
		return clean_input.chop, error_count
	end
	
	
	def search_two
		@app_lic = params[:search].nil? ? params[:app_lic] : params[:search][:lic_or_app2]
		@input = params[:search].nil? ? params[:input] : params[:search][:input2]
		@element = params[:search].nil? ? params[:element].to_i : params[:search][:element].to_i
		if @element == 1 					#company name
			search_company(@input)
		elsif @element == 2					#TIN
			search_tin(@input)
		elsif @element == 3					#inc or reg number
			search_inc_or_reg(@input)
		elsif @element == 4					#director name
			search_director(@input)
		end
	end
	
	
	def search_three
		@app_lic = params[:search].nil? ? params[:app_lic] : params[:search][:lic_or_app3]
		@b = params[:search].nil? ? params[:b_type] : params[:search][:business_type]
		@i = params[:search].nil? ? params[:i_type] : params[:search][:investment_type]
		@cat = params[:search].nil? ? params[:cat].to_i : get_category_id
		@reg = params[:search].nil? ? params[:reg].to_i : params[:address][:region].to_i
		@dis = params[:search].nil? ? params[:dis].to_i : params[:address][:district].to_i
		@date1, @date2 = params[:search].nil? ? get_dates2 : get_dates
		
		cat_id = get_categories(@cat)
		dis = @dis == 0 ? "%" : @dis.to_s
		view = "region" + @reg.to_s + @app_lic
		date = case @app_lic
					when "a" then "app_date"
					when "t" then "temp_issue_date"
					when "p" then "perm_issue_date" end
					
		if @report == 1
			@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and business_type ILIKE ? and investment_type ILIKE ? 
					and district_id ILIKE ? and category_id SIMILAR TO ? ORDER BY #{date}", @date1, @date2, @b, @i, dis, cat_id])
		else
			@count = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and business_type ILIKE ? and investment_type ILIKE ? 
					and district_id ILIKE ? and category_id SIMILAR TO ?", @date1, @date2, @b, @i, dis, cat_id])
			@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and business_type ILIKE ? and investment_type ILIKE ? 
					and district_id ILIKE ? and category_id SIMILAR TO ? ORDER BY #{date} OFFSET ? LIMIT ?", 
					@date1, @date2, @b, @i, dis, cat_id, @offset, @per_page])
		end		
		
		if @report == 1
			@sorted_applications = @applications.sort {|x,y| x.company_id <=> y.company_id}
			render :template => '/mitm_licensing_search/search_results_report', :layout => 'report'
		else
			@applications_pages = Paginator.new(self, @count, @per_page, @page)
			render :template => '/mitm_licensing_search/search_result2' if @applications.size > 0
			render :template => '/mitm_licensing_search/no_result' if @applications.size == 0
		end
	end
	
	
	def search_four
		@app_lic = params[:search].nil? ? params[:app_lic] : params[:search][:lic_or_app3]
		@cty = params[:search].nil? ? params[:cty].to_i : params[:search][:country].to_i
		@i = params[:search].nil? ? params[:i_type] : params[:search][:investment_type]
		@cat = params[:search].nil? ? params[:cat].to_i : get_category_id
		@reg = params[:search].nil? ? params[:reg].to_i : params[:address][:region].to_i
		@dis = params[:search].nil? ? params[:dis].to_i : params[:address][:district].to_i
		@date1, @date2 = params[:search].nil? ? get_dates2 : get_dates
		
		cat_id = get_categories(@cat)
		reg = @reg == 0 ? "%" : @reg.to_s
		dis = @dis == 0 ? "%" : @dis.to_s
		view = "countries0" + @app_lic
		date = case @app_lic
					when "a" then "app_date"
					when "t" then "temp_issue_date"
					when "p" then "perm_issue_date" end
					
		if @report == 1
			@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and region_id ILIKE ? and district_id ILIKE ? 
					and category_id SIMILAR TO ? and country_id = ? and investment_type ILIKE ? ORDER BY #{date}", 
					@date1, @date2, reg, dis, cat_id, @cty, @i])
		else
			@count = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and region_id ILIKE ? and district_id ILIKE ? 
					and category_id SIMILAR TO ? and country_id = ? and investment_type ILIKE ?", 
					@date1, @date2, reg, dis, cat_id, @cty, @i])
			@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE #{date} >= ? and #{date} < ? and region_id ILIKE ? and district_id ILIKE ? 
					and category_id SIMILAR TO ? and country_id = ? and investment_type ILIKE ? ORDER BY #{date} OFFSET ? LIMIT ?", 
					@date1, @date2, reg, dis, cat_id, @cty, @i, @offset, @per_page])
		end		

		if @report == 1
			@sorted_applications = sort_companies(@applications) if @report_option == 2
			render :template => '/mitm_licensing_search/search_results_report', :layout => 'report'
		else
			@applications_pages = Paginator.new(self, @count, @per_page, @page)
			render :template => '/mitm_licensing_search/search_result2' if @applications.size > 0
			render :template => '/mitm_licensing_search/no_result' if @applications.size == 0
		end
	end
	
	
	def get_dates
		date1 = Date.new(params[:range1][:year].to_i, params[:range1][:month].to_i, params[:range1][:day].to_i)
		date2 = Date.new(params[:range2][:year].to_i, params[:range2][:month].to_i, params[:range2][:day].to_i)
            date2 += 1
		return date1, date2
	end
	
	
	def get_dates2
		re = /(\d+)-(\d+)-(\d+)/
		start_date = re.match(params[:start_date])
		end_date = re.match(params[:end_date])
		date1 = Date.new(start_date[1].to_i, start_date[2].to_i, start_date[3].to_i)
		date2 = Date.new(end_date[1].to_i, end_date[2].to_i, end_date[3].to_i)
		return date1, date2
	end
	
	
	def get_licence(id, type)
		licence = Licence.find_by_temp_number(id) if type == "t"
		licence = Licence.find_by_perm_number(id) if type == "p"
		if !licence.nil?
			@application = licence.licence_application
			render :template => '/mitm_licensing_search/search_result1'
		else
			render :template => '/mitm_licensing_search/no_result'
		end
	end
	
	
	def search_company(input)
		if input =~ /\A[\w\s,.:;()'&\-\/]+\Z/
			input = '%' + input + '%'
			view = "region0" + @app_lic
			date = case @app_lic
					when "a" then "app_date"
					when "t" then "temp_issue_date"
					when "p" then "perm_issue_date" end
			
			if @report == 1
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE company_name ILIKE ? ORDER BY #{date}", input])
			else
				@count = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}
					WHERE company_name ILIKE ?", input])
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE company_name ILIKE ? ORDER BY #{date} OFFSET ? LIMIT ?", input, @offset, @per_page])
			end
			
			if @report == 1
				@sorted_applications = sort_companies(@applications) if @report_option == 2
				render :template => '/mitm_licensing_search/search_results_report', :layout => 'report'
			else
				@applications_pages = Paginator.new(self, @count, @per_page, @page)
				render :template => '/mitm_licensing_search/search_result2' if @applications.size > 0
				render :template => '/mitm_licensing_search/no_result' if @applications.size == 0		
			end
		else
			render :template => '/mitm_licensing_search/invalid_search_result2'
		end
	end
	
	
	def search_tin(input)
		input = input.delete('-')
		date = case @app_lic
					when "a" then "app_date"
					when "t" then "temp_issue_date"
					when "p" then "perm_issue_date" end
		if input =~ /\A\d{9}\Z/ && input.to_i > 0
			view = "region0" + @app_lic
			if @report == 1
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE tin_number = ? ORDER BY #{date}", input])
			else
				@count = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}
					WHERE tin_number = ?", input])
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE tin_number = ? ORDER BY #{date} OFFSET ? LIMIT ?", input, @offset, @per_page])
			end
			
			
			if @report  == 1
				@sorted_applications = sort_companies(@applications) if @report_option == 2
				render :template => '/mitm_licensing_search/search_results_report', :layout => 'report'
			else
				@applications_pages = Paginator.new(self, @count, @per_page, @page)
				render :template => '/mitm_licensing_search/search_result2' if @applications.size > 0
				render :template => '/mitm_licensing_search/no_result' if @applications.size == 0
			end
		else
			render :template => '/mitm_licensing_search/invalid_search_result2'
		end
	end
	
	
	def search_inc_or_reg(input)
		date = case @app_lic
					when "a" then "app_date"
					when "t" then "temp_issue_date"
					when "p" then "perm_issue_date" end
		if input =~ /\A\d+\Z/ && input.to_i > 0
			view = "region0" + @app_lic
			if @report == 1
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE inc_or_reg_no = ? ORDER BY #{date}", input])
			else
				@count = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}
					WHERE inc_or_reg_no = ?", input])
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE inc_or_reg_no = ? ORDER BY #{date} OFFSET ? LIMIT ?", input, @offset, @per_page])
			end
			
			if @report == 1
				@sorted_applications = sort_companies(@applications) if @report_option == 2
				render :template => '/mitm_licensing_search/search_results_report', :layout => 'report'
			else
				@applications_pages = Paginator.new(self, @count, @per_page, @page)
				render :template => '/mitm_licensing_search/search_result2' if @applications.size > 0
				render :template => '/mitm_licensing_search/no_result' if @applications.size == 0
			end
		else
			render :template => '/mitm_licensing_search/invalid_search_result2'
		end
	end
	
	
	def search_director(input)
		date = case @app_lic
					when "a" then "app_date"
					when "t" then "temp_issue_date"
					when "p" then "perm_issue_date" end
		if input =~ /\A[a-zA-Z\s-]+\Z/
			input = '%' + input + '%'
			view = "directors0" + @app_lic
			if @report == 1
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE director_name ILIKE ? ORDER BY #{date}", input])
			else
				@count = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view}
					WHERE director_name ILIKE ?", input])
				@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view}
					WHERE director_name ILIKE ? ORDER BY #{date} OFFSET ? LIMIT ?", input, @offset, @per_page])
			end			
			
			if @report == 1
				@sorted_applications = sort_companies(@applications) if @report_option == 2
				render :template => '/mitm_licensing_search/search_results_report', :layout => 'report'
			else
				@applications_pages = Paginator.new(self, @count, @per_page, @page)
				render :template => '/mitm_licensing_search/search_result2' if @applications.size > 0
				render :template => '/mitm_licensing_search/no_result' if @applications.size == 0
			end
		else
			render :template => '/mitm_licensing_search/invalid_search_result2'
		end
	end
	
	
	
	private
	
	def sort_companies(applications)
		sorted_applications = []
		sorted_applications = applications.sort {|x,y| x.company.id <=> y.company.id}
	end
	
	def sort_companies_orig(applications)
		sorted_applications = []
		if applications.size > 1
			temp = Array.new
			sorted_heap = applications.sort {|x,y| x.company.id <=> y.company.id}
		
			i = -1
			while i < sorted_heap.size
				i += 1;
				application = sorted_heap[i]
				temp << application
				if i+1 < sorted_heap.size
					j = i + 1
					while j < sorted_heap.size-1
						if sorted_heap[j].company.id == application.company.id
							temp << sorted_heap[j] 
							sorted_heap.delete_at(j)
						else
							j += 1
						end
					end
				end
				sorted_applications << temp
				temp.clear
			end
		else
			sorted_applications << applications
		end
		return sorted_applications
	end
	
end