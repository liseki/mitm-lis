class SetUp < ActiveRecord::Migration
	
	def self.up
		execute "ALTER TABLE companies_countries ADD CONSTRAINT companies_countries_pkey PRIMARY KEY (company_id, country_id);"
		
		execute "ALTER TABLE addresses ADD CONSTRAINT fk_address_company FOREIGN KEY (company_id) REFERENCES companies(id);"	
		execute "ALTER TABLE addresses ADD CONSTRAINT fk_address_ward FOREIGN KEY (ward_id) REFERENCES wards(id);"
		execute "ALTER TABLE attachments ADD CONSTRAINT fk_attachments_licence_application FOREIGN KEY (licence_application_id) REFERENCES licence_applications(id);"
		execute "ALTER TABLE categories ADD CONSTRAINT fk_category FOREIGN KEY (parent_id) REFERENCES categories(id);"
            execute "ALTER TABLE companies ADD CONSTRAINT fk_company FOREIGN KEY (parent_id) REFERENCES companies(id);"
		execute "ALTER TABLE companies_countries ADD CONSTRAINT fk_cc_company FOREIGN KEY (company_id) REFERENCES companies(id);"
		execute "ALTER TABLE companies_countries ADD CONSTRAINT fk_cc_country FOREIGN KEY (country_id) REFERENCES countries(id);"
		execute "ALTER TABLE directors ADD CONSTRAINT fk_director_company FOREIGN KEY (company_id) REFERENCES companies(id);"
		execute "ALTER TABLE districts ADD CONSTRAINT fk_district_region FOREIGN KEY (region_id) REFERENCES regions(id);"
		execute "ALTER TABLE licence_applications ADD CONSTRAINT fk_licence_application_user FOREIGN KEY (user_id) REFERENCES users(id);"
		execute "ALTER TABLE licence_applications ADD CONSTRAINT fk_licence_application_category FOREIGN KEY (category_id) REFERENCES categories(id);"
		execute "ALTER TABLE licence_applications ADD CONSTRAINT fk_licence_application_licence FOREIGN KEY (licence_id) REFERENCES licences(id);"
            execute "ALTER TABLE licence_applications ADD CONSTRAINT fk_licence_application_company FOREIGN KEY (company_id) REFERENCES companies(id);"
		execute "ALTER TABLE licences ADD CONSTRAINT fk_licence_category FOREIGN KEY (category_id) REFERENCES categories(id);"
		execute "ALTER TABLE licences ADD CONSTRAINT fk_licence_user FOREIGN KEY (user_id) REFERENCES users(id);"
		execute "ALTER TABLE tins ADD CONSTRAINT fk_tins_company FOREIGN KEY (company_id) REFERENCES companies(id);"
		execute "ALTER TABLE wards ADD CONSTRAINT fk_ward_district FOREIGN KEY (district_id) REFERENCES districts(id);"
		
		Country.reset_column_information
		ActionView::Helpers::FormOptionsHelper::COUNTRIES.each do |country_name|
			Country.create :name => country_name
		end	
	end


	def self.down
		
	end
end
