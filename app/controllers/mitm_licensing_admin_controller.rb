class MitmLicensingAdminController < ApplicationController
	
	layout 'mitm',	:only => [:categories, :users, :new_user, :change_root_password]
	before_filter		:admin_only, :only => [:destroy_user]
	before_filter 		:admin_only2, :only => [:add_category, :add_sub_category, :rename_category, :delete_category, 
											:move_category, :show_function]
	before_filter		:admin_only3, :only => [:new_user, :create_new_user, :change_root_password, :update_root_password]
	
	
	def users
		@users = User.find(:all, :order => "id ASC")
	end
	
	
	def new_user
		@user = User.new
	end
	
	
	def change_root_password
		@root = Root.new
	end
	
	
	def update_root_password
		@new_root = Root.new(params[:root])
		if @new_root.valid?
			@root = Root.find(1)
			if User.pword(@new_root.password) == @root.root_password
				@root.update_attribute("root_password", User.pword(@new_root.new_password))
				render :template => '/mitm_licensing_admin/root_password_changed'
			else
				render :template => '/mitm_licensing_admin/wrong_root_password'
			end
		else
			render :template => '/mitm_licensing_admin/change_root_password_errors'
		end
	end
	
	
	def create_new_user
		@user = User.new(params[:user])
		if @user.save
			render :template => '/mitm_licensing_admin/new_user_created'
		else
			render :template => '/mitm_licensing_admin/new_user_errors'
		end
	end
	
	
	def destroy_user
		begin
			user = User.find(params[:id].to_i)
			user.destroy
			flash[:notice] = "User #{user.name} removed."
			@users = User.find(:all, :order => "id ASC")
			render :template => '/mitm_licensing_admin/user_deleted'
		rescue ActiveRecord::RecordNotFound
			flash[:notice] = "That user was not found!"
			render :template => '/mitm_licensing_admin/user_not_deleted'
		rescue
			flash[:notice] = "Can't delete that user!"
			render :template => '/mitm_licensing_admin/user_not_deleted'
		end
	end
	
	
	def categories
		@category = Category.new
		@category.name = nil
		@categories = get_categories
	end
	
	
	def show_function
		@option = params[:option].to_i
		@categories = get_categories
		render :template => '/mitm_licensing_admin/show_function'
	end
	
	
	def add_category
		@model_title = "Category"
		root = Category.find_by_name("Schedule A")
		@category = root.children.create("name" =>params[:category][:name])
		if @category.save
			@categories = get_categories
			render :template => '/mitm_licensing_admin/update_categories1'
		else
			render :template => '/mitm_licensing_admin/new_category_errors'
		end
	end
	
	
	def add_sub_category
		@model_title = "Sub-category"
		@func = "sub"
		if params[:category][:parent_id] != ""
			begin
				parent_category = Category.find(params[:category][:parent_id].to_i)
				if parent_category.ancestors.size <= 10
					@category = parent_category.children.create("name" => params[:category][:name])
					if @category.save
						@categories = get_categories
						render :template => '/mitm_licensing_admin/update_categories2'
					else
						render :template => '/mitm_licensing_admin/new_category_errors'
					end
				else
					render :template => '/mitm_licensing_admin/too_many_sub_categories'
				end
			rescue ActiveRecord::RecordNotFound
				render :template => '/mitm_licensing_admin/category_not_found'
			end
		else
			@blank = params[:category][:name] == "" ? 1 : 0
			render :template => '/mitm_licensing_admin/invalid_parent_category'
		end
	end
	
	
	def rename_category
		@model_title = "Category"
		@func = "ren"
		if params[:category][:category_id].to_i > 0
			begin
				@category = Category.find(params[:category][:category_id].to_i)
				@category.name = params[:category][:name]
				if @category.save
					@categories = get_categories
					render :template => '/mitm_licensing_admin/update_categories3'
				else
					render :template => '/mitm_licensing_admin/rename_category_errors'
				end
			rescue ActiveRecord::RecordNotFound
				render :template => '/mitm_licensing_admin/category_not_found'
			end
		else
			@blank = params[:category][:name] == "" ? 2 : 0
			render :template => '/mitm_licensing_admin/invalid_parent_category'
		end
	end
	
	
	def delete_category
		@model_title = "Category"
		@func = "del"
		if params[:category][:category_id].to_i > 0
			begin
				@category = Category.find(params[:category][:category_id].to_i)
				@error_count = @category.licence_applications_count + @category.licences_count + @category.categories_count
				if @error_count == 0
					@category.destroy
					@categories = get_categories
					render :template => '/mitm_licensing_admin/update_categories5'
				else
					render :template => 'mitm_licensing_admin/delete_category_errors'
				end
			rescue ActiveRecord::RecordNotFound
				render :template => '/mitm_licensing_admin/category_not_found'
			end
		else
			render :template => '/mitm_licensing_admin/invalid_parent_category'
		end
	end		
	
	
	def cancel_new_category
		render :template => '/mitm_licensing_admin/reset_form'
	end
	
	
	def move_category
		@model_title = "Category"
		@func = "mov"
		if params[:category][:parent_id] != ""
			if params[:category][:category_id] != ""
				begin
					@category = Category.find(params[:category][:category_id].to_i)
					new_parent_category = Category.find(params[:category][:parent_id].to_i)
					parent_category = @category.parent
					if parent_category.id != new_parent_category.id
						if @category.update_attribute(:parent_id, new_parent_category.id) && 
						parent_category.update_attribute(:categories_count, parent_category.categories_count - 1) && 
						new_parent_category.update_attribute(:categories_count, new_parent_category.categories_count + 1)
							@categories = get_categories
							render :template => '/mitm_licensing_admin/update_categories4'
						else
							render :template => '/mitm_licensing_admin/new_category_errors'
						end
					else
						render :template => '/mitm_licensing_admin/reset_form'
					end
				rescue ActiveRecord::RecordNotFound
					render :template => '/mitm_licensing_admin/category_not_found'
				end
			else
				render :template => '/mitm_licensing_admin/move_category_error'
			end
		else
			@blank = params[:category][:category_id] == "" ? 3 : 0
			render :template => '/mitm_licensing_admin/invalid_parent_category'
		end
	end
	
	
	private
	
	
	def get_categories
		@root = Category.find_by_name("Schedule A")
		categories = []
		if @root.categories_count > 0
			categories = @root.children
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
		end
		return categories
	end	
	
	
	def admin_only
		unless session[:mitm_user_type].to_i == 1
			flash[:notice] = "Action reserved for administrative users!"
			render :template => '/mitm_licensing_admin/user_not_deleted'
		end
	end
	
	
	def admin_only2
		unless session[:mitm_user_type].to_i == 1
			redirect_to :controller => "mitm_licensing_admin", :action => "categories"
		end
	end
	
	
	def admin_only3
		unless session[:mitm_user_type].to_i == 1
			redirect_to :controller => "mitm_licensing_admin", :action => "users"
		end
	end
	
end
