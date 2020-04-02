File.open("views.sql", "w") do |write_file|
	create_view = "SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
					licence_applications.signed, licence_applications.app_date, companies.id AS company_id, 
					companies.name AS company_name, companies.inc_or_reg_no, companies.business_type,
					companies.investment_type, tins.tin_number, categories.id AS category_id, categories.name AS category_name, 
					licences.licence_type, licences.temp_number, licences.temp_issue_date, licences.perm_number, 
					licences.perm_issue_date, addresses.p_o_box, addresses.email, addresses.block, addresses.plot_no, addresses.street, 
					addresses.house_no, addresses.telephone, addresses.fax, wards.name AS ward_name, wards.id AS ward_id, 
					districts.name AS district_name, districts.id AS district_id, regions.name AS region_name, regions.id AS region_id, 
					attachments.cert_inc_or_reg, attachments.memorandum, attachments.tz_proof, attachments.att_powers, 
					attachments.premises, attachments.tin_cert, attachments.cal, attachments.tal, attachments.prof_cert, 
					attachments.air_sea_worth, attachments.other
					FROM licence_applications
					FULL JOIN companies ON licence_applications.company_id = companies.id
					JOIN categories ON licence_applications.category_id = categories.id
					FULL JOIN licences ON licence_applications.licence_id = licences.id
					FULL JOIN attachments ON licence_applications.id = attachments.licence_application_id
					FULL JOIN tins ON companies.id = tins.company_id
					FULL JOIN addresses ON companies.id = addresses.company_id
					JOIN wards ON addresses.ward_id = wards.id
					JOIN districts ON wards.district_id = districts.id
					JOIN regions ON districts.region_id = regions.id 
					"
	
	create_view2 = "SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
					licence_applications.signed, licence_applications.app_date, companies.id AS company_id, 
					companies.name AS company_name, directors.name as director_name, companies.inc_or_reg_no, companies.business_type, 
					companies.investment_type, tins.tin_number, categories.id AS category_id, categories.name AS category_name, 
					licences.licence_type, licences.temp_number, licences.temp_issue_date, licences.perm_number, 
					licences.perm_issue_date, addresses.p_o_box, addresses.email, addresses.block, addresses.plot_no, addresses.street, 
					addresses.house_no, addresses.telephone, addresses.fax, wards.name AS ward_name, wards.id AS ward_id, 
					districts.name AS district_name, districts.id AS district_id, regions.name AS region_name, regions.id AS region_id, 
					attachments.cert_inc_or_reg, attachments.memorandum, attachments.tz_proof, attachments.att_powers, 
					attachments.premises, attachments.tin_cert, attachments.cal, attachments.tal, attachments.prof_cert, 
					attachments.air_sea_worth, attachments.other
					FROM licence_applications
					FULL JOIN companies ON licence_applications.company_id = companies.id
					JOIN categories ON licence_applications.category_id = categories.id
					FULL JOIN licences ON licence_applications.licence_id = licences.id
					FULL JOIN attachments ON licence_applications.id = attachments.licence_application_id
					FULL JOIN tins ON companies.id = tins.company_id
					FULL JOIN addresses ON companies.id = addresses.company_id
					JOIN wards ON addresses.ward_id = wards.id
					JOIN districts ON wards.district_id = districts.id
					JOIN regions ON districts.region_id = regions.id 
					FULL JOIN directors ON companies.id = directors.company_id 
					"
	
	create_view3 = "SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
					licence_applications.signed, licence_applications.app_date, companies.id AS company_id, 
					companies.name AS company_name, companies.inc_or_reg_no, companies.business_type, companies_countries.country_id,
					countries.name AS country, companies.investment_type, tins.tin_number, categories.id AS category_id, 
					categories.name AS category_name, licences.licence_type, licences.temp_number, licences.temp_issue_date, 
					licences.perm_number, licences.perm_issue_date, addresses.p_o_box, addresses.email, addresses.block, addresses.plot_no, 
					addresses.street, addresses.house_no, addresses.telephone, addresses.fax, wards.name AS ward_name, wards.id AS ward_id, 
					districts.name AS district_name, districts.id AS district_id, regions.name AS region_name, regions.id AS region_id, 
					attachments.cert_inc_or_reg, attachments.memorandum, attachments.tz_proof, attachments.att_powers, 
					attachments.premises, attachments.tin_cert, attachments.cal, attachments.tal, attachments.prof_cert, 
					attachments.air_sea_worth, attachments.other
					FROM licence_applications
					FULL JOIN companies ON licence_applications.company_id = companies.id
					JOIN categories ON licence_applications.category_id = categories.id
					FULL JOIN licences ON licence_applications.licence_id = licences.id
					FULL JOIN attachments ON licence_applications.id = attachments.licence_application_id
					FULL JOIN tins ON companies.id = tins.company_id
					FULL JOIN addresses ON companies.id = addresses.company_id
					JOIN wards ON addresses.ward_id = wards.id
					JOIN districts ON wards.district_id = districts.id
					JOIN regions ON districts.region_id = regions.id 
					FULL JOIN companies_countries ON companies.id = companies_countries.company_id
					JOIN countries ON companies_countries.country_id = countries.id
					"
	
	for i in 0..0
		### all countries (applications) view
		view = "countries" + i.to_s + "a"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view3} WHERE licence_applications.processed = false;\n\n"
		puts "create #{view}"
		
		### all countries (temporary licences) views
		view = "countries" + i.to_s + "t"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view3} WHERE licence_applications.processed = true and licences.temp_number is NOT NULL;\n\n"
		puts "create #{view}"
		
		### all countries (permanent licences) view
		view = "countries" + i.to_s + "p"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view3} WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text;\n\n"
		puts "create #{view}"
	end
	
	
	for i in 0..0
		### all regions directors (applications) views
		view = "directors" + i.to_s + "a"
		write_file.puts "CREATE VIEW #{view} AS 
						#{create_view2} WHERE licence_applications.processed = false;\n\n"
		puts "create #{view}"
	
		### all regions directors (temporary licences) views
		view = "directors" + i.to_s + "t"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view2} WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL;\n\n"
		puts "create #{view}"
		
		### all regions directors (permanent licences) views
		view = "directors" + i.to_s + "p"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view2} WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text;\n\n"
		puts "create #{view}"
	end


	for i in 0..0
		### all regions applications views
		view = "region" + i.to_s + "a"
		write_file.puts "CREATE VIEW #{view} AS 
						#{create_view} WHERE licence_applications.processed = false;\n\n"
		puts "create #{view}"
	
		### all regions temporary licences views
		view = "region" + i.to_s + "t"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view} WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL;\n\n"
		puts "create #{view}"
		
		### all regions permanent licences views
		view = "region" + i.to_s + "p"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view} WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text;\n\n"
		puts "create #{view}"
	end
	
	for i in 1..26
		### region applications views
		view = "region" + i.to_s + "a"
		write_file.puts "CREATE VIEW #{view} AS 
						#{create_view} WHERE licence_applications.processed = false and regions.id = #{i};\n\n"
		puts "create #{view}"
	
		### regions temporary licences views
		view = "region" + i.to_s + "t"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view} WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = #{i};\n\n"
		puts "create #{view}"
		
		### regions permanent licences views
		view = "region" + i.to_s + "p"
		write_file.puts "CREATE VIEW #{view} AS
						#{create_view} WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = #{i};\n\n"
		puts "create #{view}"
	end
end