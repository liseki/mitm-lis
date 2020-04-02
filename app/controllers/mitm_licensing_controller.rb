class MitmLicensingController < ApplicationController

	layout 'mitm', 	:only => [:new_application, :new_application2, :application, :edit_application, :company, :applications, 
								:pending_licences, :edit_temp_licence, :edit_perm_licence, :branch_application]
	before_filter		:check_edit, :only => [:edit_application, :update_application]
	before_filter		:check_user, :only => [:new_application, :new_application2, :create_new_application, :create_new_application2, 
											:edit_application, :update_application, :issue_temp_licence, :issue_perm_licence, 
											:delete_application, :check_company, :branch_application]
	before_filter		:check_admin, :only => [:edit_temp_licence, :update_temp_licence, :edit_perm_licence, :update_perm_licence]
	
	def index
		redirect_to :controller => "mitm_licensing_search", :action => "index"
	end
	
	
	def delete_application
		@application = LicenceApplication.find(params[:id].to_i)
		if !@application.processed
			if @application.company.licence_applications.size == 1
				begin
					LicenceApplication.transaction(@application) do
						@application.company.destroy
						@application.company.shareholders.clear
						flash[:notice] = "Application successfully deleted."
					end
				rescue Exception => e
					flash[:notice] = "Application deletion failed!"
				end
			else
				begin
					LicenceApplication.transaction(@application) do
						@application.destroy
						flash[:notice] = "Application successfully deleted."
					end
				rescue Exception => e
					flash[:notice] = "Application deletion failed!"
				end
			end
		else
			flash[:notice] = "Application could not be deleted!"
		end
		redirect_to :action => "applications"
	end
	
	
	def new_application
		@licence_application = LicenceApplication.new
		@company = Company.new
		@director = Director.new
		@tin = Tin.new
		@address = Address.new
		@attachment = Attachment.new
		@main_categories = Category.find_by_name("Schedule A").children
	end
	
	
	def new_application2
		begin
			@company = Company.find(params[:id].to_i)
			@licence_application = LicenceApplication.new
			@attachment = Attachment.new
			@main_categories = Category.find_by_name("Schedule A").children
		rescue ActiveRecord::RecordNotFound
			render :template => '/mitm_licensing/company_not_found'
		end	
	end
	
	
	def branch_application
		begin
			@company = Company.find(params[:id].to_i)
			@licence_application = LicenceApplication.new
			@attachment = Attachment.new
			@main_categories = Category.find_by_name("Schedule A").children
		rescue ActiveRecord::RecordNotFound
			render :template => '/mitm_licensing/company_not_found'
		end	
	end
	
	
	def check_company
		if request.xhr?
			if params[:name] != ""
				name = "%" + params[:name] + "%"
				@companies = Company.find_by_sql(["SELECT companies.*
													FROM companies
													WHERE companies.name ILIKE ?", name])
				render :template => '/mitm_licensing/company_check_result', :layout => false
			else
				render :template => '/mitm_licensing/no_check', :layout => false
			end
		else
			@company = Company.new
			render :layout => 'mitm'
		end
	end
	
	
	def company
		begin
			@company = Company.find(params[:id].to_i, :include => [:licence_applications, :address, :tin, :directors])
		rescue ActiveRecord::RecordNotFound
			render :template => '/mitm_licensing/company_not_found'
		end	
	end
	
	
	def company_report
		begin
			@company = Company.find(params[:id].to_i, :include => [:licence_applications, :address, :tin, :directors])
		rescue ActiveRecord::RecordNotFound
			render :template => '/mitm_licensing/company_not_found'
		end	
		render :layout => 'report'
	end

	
	def create_new_application
		category_id = get_category_id
		if category_id > 0			
			@company = Company.new(params[:company])
			@company.subsidiary = params[:licence_application][:subsidiary].to_i == 1 ? true : false
			if @company.valid?
				@application = get_application(category_id)
				@application.company = @company
				if @application.valid?
					@director = Director.new(params[:director])
					if @director.valid?
						@tin = Tin.new(params[:tin])
						@tin.subsidiary = @application.subsidiary
						@tin.company = @company
						if @tin.valid?
							@address = Address.new(params[:address])
							@address.company = @company
							if @address.valid?
								@attachment = Attachment.new(params[:attachment])
								@attachment.licence_application = @application
								save_application
								if @application.subsidiary
									@principle = get_parent_company
									@principle.children << @company
								end
								render :template => '/mitm_licensing/application_completed'
							else
								@error_num = 6; render :template => '/mitm_licensing/new_application_errors'
							end
						else
							@error_num = 5; render :template => '/mitm_licensing/new_application_errors'
						end
					else
						@error_num = 4; render :template => '/mitm_licensing/new_application_errors'
					end
				else
					@error_num = 2; render :template => '/mitm_licensing/new_application_errors'
				end
			else
				@error_num = 3; render :template => '/mitm_licensing/new_application_errors'
			end
		else
			@error_num = 1; 
			render :template => '/mitm_licensing/new_application_errors'
		end
	end
      
	
	def create_new_application2
		category_id = get_category_id
		if category_id > 0	
			@company = Company.find(params[:id].to_i)
			@application = get_application(category_id)
			@application.company = @company
			if @application.valid?
				@attachment = Attachment.new(params[:attachment])
				@attachment.licence_application = @application
				@application.save; @attachment.save; @company.save
				render :template => '/mitm_licensing/application_completed'
			else
				@error_num = 2; render :template => '/mitm_licensing/new_application_errors'
			end
		else
			@error_num = 1; 
			render :template => '/mitm_licensing/new_application_errors'
		end
	end
	
	
	def create_new_branch_application
		category_id = get_category_id
		if category_id > 0	
			@main_company = Company.find(params[:id].to_i)
			set_up_branch
			@application = get_application(category_id)
			@address = Address.new(params[:address])
			@address.company = @company
			if @address.valid?
				@application.company = @company
				if @application.valid?
					@attachment = Attachment.new(params[:attachment])
					@attachment.licence_application = @application
					@company.name += " (#{@address.ward.district.name}, #{address.ward.district.region.name} Branch)"
					@application.save; @attachment.save; @address.save; @company.save
					@main_company.children << @company
					render :template => '/mitm_licensing/application_completed'
				else
					@error_num = 2; render :template => '/mitm_licensing/new_application_errors'
				end
			else
				@error_num = 6; render :template => '/mitm_licensing/new_application_errors'
			end
		else
			@error_num = 1; 
			render :template => '/mitm_licensing/new_application_errors'
		end
	end
      
	
      def setup_districts
            if params[:reg_id].to_i > 0
                  @districts = District.find(:all, :conditions => ["region_id = ?", params[:reg_id].to_i])
                  render :template => '/mitm_licensing/setup_districts'
            elsif params[:reg_id].to_i == 0
                  render :template => '/mitm_licensing/hide_districts_and_wards'
            end
      end
      
      
      def setup_wards
            if params[:dis_id].to_i > 0
                  @wards = Ward.find(:all, :conditions => ["district_id = ?", params[:dis_id].to_i])
                  render :template => '/mitm_licensing/setup_wards'
            elsif params[:dis_id].to_i == 0
                  render :template => '/mitm_licensing/hide_wards'
            end
      end
  
  
	def other_shareholders
		@num = params[:num].to_i
		render :template => '/mitm_licensing/add_another_shareholder'
	end
	
	
	def show_sub_categories
		if params[:main_cat_id].to_i > 0
			category = Category.find(params[:main_cat_id].to_i)
			@num = category.ancestors.size
			if category.children.size > 0
				@sub_categories = category.children
				render :template => '/mitm_licensing/show_sub_categories'
			else
				render :template => '/mitm_licensing/hide_sub_categories'
			end
		elsif params[:main_cat_id].to_i == 0
			@num = 1
			render :template => '/mitm_licensing/hide_sub_categories'
		end
	end
	
	
	def reset_new_application
		@num = 1
		render :template => '/mitm_licensing/reset_form'
	end
	
	
	def reset_new_application2
		@num = 1
		render :template => '/mitm_licensing/reset_form2'
	end	
	
	
	def cancel_new_application
		render :template => '/mitm_licensing/cancel_application'
	end
	
	
	def applications
            @page = (params[:page] ||= 1).to_i
		per_page = 20
		offset = (@page -1) * per_page
		
		@application_count = LicenceApplication.count(:conditions => ["processed = ?", false])
		@application_pages = Paginator.new(self, @application_count, per_page, @page)
		@applications = LicenceApplication.find(:all,
									:include => [:category, :company],
									:conditions => ["processed = ?", false],
                                                      :offset => offset,
                                                      :limit => per_page,
                                                      :order => "licence_applications.id DESC")
	end
	
	
	def pending_licences
            @page = (params[:page] ||= 1).to_i
		per_page = 20
		offset = (@page -1) * per_page
		view = "region0t"
		
		@application_count = LicenceApplication.count_by_sql(["SELECT COUNT(*) FROM #{view} WHERE licence_type = ?", "t"])
		@application_pages = Paginator.new(self, @application_count, per_page, @page)
		@applications = LicenceApplication.find_by_sql(["SELECT * FROM #{view} WHERE licence_type = ? OFFSET ? LIMIT ?", 
													"t", offset, per_page])
	end
	
	
	def application
		begin
			@application = LicenceApplication.find(params[:id].to_i, :include => [:category, :attachment, :company])
			@principle = get_parent_company if @application.subsidiary
		rescue ActiveRecord::RecordNotFound
			render :template => '/mitm_licensing/no_result'
		end	
	end
	
	
	def application_report
		begin
			@application = LicenceApplication.find(params[:id].to_i, :include => [:category, :attachment, :company])
			@principle = get_parent_company if @application.subsidiary
		rescue ActiveRecord::RecordNotFound
			render :template => '/mitm_licensing/no_result'
		end	
		render :layout => "report"
	end
	
	
	def edit_application
		@licence_application = LicenceApplication.find(params[:id].to_i)
		@section = params[:sec].to_i
		if @section == 1
			edit_section1
		elsif @section == 2 || @section == 3
			edit_section2_and3
		elsif @section == 4
			edit_section4
		elsif @section == 6		
			@attachment = @licence_application.attachment
		end
	end
	
	
	def update_application
		@licence_application = LicenceApplication.find(params[:id].to_i)
		@section = params[:sec].to_i
		if @section == 1
			update_section1
		elsif @section == 2 || @section == 3
			update_section2_and3
		elsif @section == 4
			update_section4
		elsif @section == 5
			update_section5
		elsif @section == 6
			update_section6
		end
	end
	
	
	def cancel_edit
		@id = params[:id].to_i
		render :template => '/mitm_licensing/cancel_edit'
	end
	
	
	def issue_temp_licence
		@application = LicenceApplication.find(params[:app_id].to_i)
		@licence = get_temp_licence
		if @licence.save
			@application.update_attribute("processed", true)
			render :template => '/mitm_licensing/issue_temp_licence'
		else
			render :template => '/mitm_licensing/invalid_licence'
		end
	end
	
	
	def issue_perm_licence
		@application = LicenceApplication.find(params[:app_id].to_i)
		@licence = @application.licence
		if !@licence.nil?
			@licence.skip_temp = 1
			@licence.issue_perm
			@licence.perm_number = params[:licence][:perm_number]
			@licence.perm_number_confirmation = params[:licence][:perm_number_confirmation]
			@licence.perm_issue_date = Date.new(params[:perm][:year].to_i, params[:perm][:month].to_i, params[:perm][:day].to_i)
			if @licence.save
				render :template => '/mitm_licensing/issue_perm_licence'
			else
				render :template => '/mitm_licensing/invalid_licence'
			end
		else
			if @application.company.licence_applications.size > 0 && @application.company.got_perm_licences == 1 || @application.subsidiary
				@licence = get_perm_licence
				if @licence.save
					@application.update_attribute("processed", true)
					render :template => '/mitm_licensing/issue_perm_licence'
				else
					render :template => '/mitm_licensing/invalid_licence'
				end
			else
				render :template => '/mitm_licensing/no_temp_licence'
			end
		end
	end


	def reset_licence_issue
		render :template => '/mitm_licensing/reset_licence_issue'
	end
	
	
	def update_categories
		@main_categories = Category.find_by_name("Schedule A").children
	end
	
	
	def edit_temp_licence
		@licence = LicenceApplication.find(params[:id]).licence
		if !@licence.nil? && !@licence.temp_number.nil?
			@licence.temp_number_confirmation = @licence.temp_number
		else
			redirect_to :action => "application", :id => params[:id]
		end
	end
	
	
	def update_temp_licence
		if User.pword(params[:root][:password]) == Root.find(1).root_password
			@old_licence = LicenceApplication.find(params[:id]).licence
			@old_licence.old_number = @old_licence.temp_number
			@old_licence.temp_number_confirmation = params[:licence][:temp_number_confirmation]
			if @old_licence.update_attributes(:temp_number => params[:licence][:temp_number])
				@old_licence.update_attribute("temp_issue_date", 
					Date.new(params[:temp][:year].to_i, params[:temp][:month].to_i, params[:temp][:day].to_i))
				render :template => '/mitm_licensing/licence_updated'
			else
				render :template => '/mitm_licensing/licence_update_errors'
			end
		else
			render :template => '/mitm_licensing/wrong_root_password'
		end
	end
	
	
	def edit_perm_licence
		@licence = LicenceApplication.find(params[:id]).licence
		if !@licence.nil? && !@licence.perm_number.nil?
			@licence.perm_number_confirmation = @licence.perm_number
		else
			redirect_to :action => "application", :id => params[:id]
		end
	end
	
	
	def update_perm_licence
		if User.pword(params[:root][:password]) == Root.find(1).root_password
			@old_licence = LicenceApplication.find(params[:id]).licence
			@old_licence.old_number = @old_licence.perm_number
			@old_licence.perm_number_confirmation = params[:licence][:perm_number_confirmation]
			@old_licence.skip_temp = 1
			if @old_licence.update_attributes(:perm_number => params[:licence][:perm_number])
				@old_licence.update_attribute("perm_issue_date", 
					Date.new(params[:perm][:year].to_i, params[:perm][:month].to_i, params[:perm][:day].to_i))
				render :template => '/mitm_licensing/licence_updated'
			else
				render :template => '/mitm_licensing/licence_update_errors'
			end
		else
			render :template => '/mitm_licensing/wrong_root_password'
		end
	end
	
	
	private
	
	
	def get_category_id
		if params[:licence_application][:main_category].to_i > 0
			categories = Array.new(11)
			categories[0] = params[:licence_application][:main_category]
			1.upto(10) {|i| categories[i] = params[:licence_application]["sub_category" + i.to_s]}
			categories = categories.compact
			return categories[categories.size - 1].to_i
		else
			return 0
		end
	end
	
	
	def get_application(category_id)
		application = LicenceApplication.new
		application.signed = params[:licence_application][:signed]
		application.subsidiary = params[:licence_application][:subsidiary]
		application.principal_licence = params[:licence_application][:principal_licence]
		application.app_date = Date.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
		application.category = Category.find(category_id)
		return application
	end
	
	
	def get_parent_company
		Licence.find_by_perm_number(@application.principal_licence).licence_application.company
	end
	
	
	def save_application
		@application.save
		@company.save
		save_directors
		@tin.save
		@address.save
		@attachment.save
		save_shareholders	
	end
	
	
	def save_directors
		@director.names_holder.each do|director_name| 
			Director.new do |director|
				director.name = director_name
				director.names = @director.names	#to pass validation
				director.company = @company
				director.save
			end
		end
	end
	
	
	def save_shareholders
		@company.holders.each {|country_id| @company.shareholders << Country.find(country_id)}
	end
	
	
	def edit_section1
		@company = @licence_application.company
		if @company.business_type == "ltd": @company.inc_no = @company.inc_or_reg_no
		elsif @company.business_type == "cmp": @company.reg_no = @company.inc_or_reg_no end
		@company.setup_shareholders
		@tin = @company.tin
		@director = @company.directors[0]
		@director.names = @company.show_directors
	end
	
	
	def edit_section2_and3
		@company = @licence_application.company
		@address = @company.address
		@address.district = @address.ward.district
		@address.region = @address.ward.district.region
		@address.phone = @address.telephone
		@address.box = @address.p_o_box
		@address.fax_no = @address.fax
	end
	
	
	def edit_section4
		@root = Category.find_by_name("Schedule A")
		category = @licence_application.category
		categories= Array.[] category.id
		while category.ancestors.size > 1
			category = category.parent
			categories.insert(0, category.id)
		end
		@licence_application.setup_categories(categories)
	end
	
	
	def update_section1
		@company = @licence_application.company
		@tin = @company.tin
		@tin.subsidiary = 1 if @company.parent
		@company.subsidiary = @company.parent ? true : false
		@director = @company.directors[0]
		if @director.update_attributes(params[:director])
			@company.directors.each {|director| director.destroy}
			save_directors
			if @tin.update_attributes(params[:tin])
				@company.shareholders.clear
				if @company.update_attributes(params[:company])
					save_shareholders
					render :template => '/mitm_licensing/update_done'
				else
					@error_num = 3; render :template => '/mitm_licensing/new_application_errors'
				end
			else
				@error_num = 5; render :template => '/mitm_licensing/new_application_errors'
			end
		else
			@error_num = 4; render :template => '/mitm_licensing/new_application_errors'
		end
	end
	
	
	def update_section2_and3
		@company = @licence_application.company
		@address = @company.address
		if @address.update_attributes(params[:address])
			render :template => '/mitm_licensing/update_done'
		else
			@error_num = 6; render :template => '/mitm_licensing/new_application_errors'
		end
	end
	
	
	def update_section4
		category = get_category_id
		if category > 0
			@licence_application.update_attribute("category_id", category)
			render :template => '/mitm_licensing/update_done'
		else
			@error_num = 1; render :template => '/mitm_licensing/new_application_errors'
		end
	end
		
		
	def update_section5
		app_date = Date.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
		@licence_application.update_attribute(:app_date, app_date)
		@licence_application.update_attribute(:signed, params[:licence_application][:signed])
		render :template => '/mitm_licensing/update_done'
	end
	
	
	def update_section6
		@attachment = @licence_application.attachment
		@attachment.update_attributes(params[:attachment])
		render :template => '/mitm_licensing/update_done'	
	end
	
	
	def get_temp_licence
		licence = Licence.new(params[:licence])
		licence.licence_application = @application
		licence.category = @application.category
		licence.temp_issue_date = Date.new(params[:temp][:year].to_i, params[:temp][:month].to_i, params[:temp][:day].to_i)
		licence.issue_temp
		return licence
	end
	
	
	def get_perm_licence
		licence = Licence.new(params[:licence])
		licence.skip_temp = 1
		licence.licence_application = @application
		licence.category = @application.category
		licence.perm_issue_date = Date.new(params[:perm][:year].to_i, params[:perm][:month].to_i, params[:perm][:day].to_i)
		licence.issue_perm
		return licence
	end
	
	
	def check_edit
		licence_application = LicenceApplication.find(params[:id].to_i)
		unless licence_application.company.got_perm_licences == 0
			redirect_to :action => "application", :id => licence_application.id
		end
	end
	
	
	def check_user
		unless session[:mitm_user_type].to_i >= 0
			redirect_to :controller => "mitm_licensing_search"
		end
	end
	
	def check_admin
		licence_application = LicenceApplication.find(params[:id].to_i)
		unless session[:mitm_user_type].to_i == 1
			redirect_to :action => "application", :id => licence_application.id
		end
	end
	
	
end