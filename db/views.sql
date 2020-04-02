CREATE VIEW countries0a AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false;

CREATE VIEW countries0t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true and licences.temp_number is NOT NULL;

CREATE VIEW countries0p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text;

CREATE VIEW directors0a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false;

CREATE VIEW directors0t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL;

CREATE VIEW directors0p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text;

CREATE VIEW region0a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false;

CREATE VIEW region0t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL;

CREATE VIEW region0p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text;

CREATE VIEW region1a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 1;

CREATE VIEW region1t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 1;

CREATE VIEW region1p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 1;

CREATE VIEW region2a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 2;

CREATE VIEW region2t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 2;

CREATE VIEW region2p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 2;

CREATE VIEW region3a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 3;

CREATE VIEW region3t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 3;

CREATE VIEW region3p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 3;

CREATE VIEW region4a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 4;

CREATE VIEW region4t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 4;

CREATE VIEW region4p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 4;

CREATE VIEW region5a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 5;

CREATE VIEW region5t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 5;

CREATE VIEW region5p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 5;

CREATE VIEW region6a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 6;

CREATE VIEW region6t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 6;

CREATE VIEW region6p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 6;

CREATE VIEW region7a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 7;

CREATE VIEW region7t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 7;

CREATE VIEW region7p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 7;

CREATE VIEW region8a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 8;

CREATE VIEW region8t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 8;

CREATE VIEW region8p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 8;

CREATE VIEW region9a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 9;

CREATE VIEW region9t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 9;

CREATE VIEW region9p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 9;

CREATE VIEW region10a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 10;

CREATE VIEW region10t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 10;

CREATE VIEW region10p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 10;

CREATE VIEW region11a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 11;

CREATE VIEW region11t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 11;

CREATE VIEW region11p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 11;

CREATE VIEW region12a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 12;

CREATE VIEW region12t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 12;

CREATE VIEW region12p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 12;

CREATE VIEW region13a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 13;

CREATE VIEW region13t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 13;

CREATE VIEW region13p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 13;

CREATE VIEW region14a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 14;

CREATE VIEW region14t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 14;

CREATE VIEW region14p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 14;

CREATE VIEW region15a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 15;

CREATE VIEW region15t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 15;

CREATE VIEW region15p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 15;

CREATE VIEW region16a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 16;

CREATE VIEW region16t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 16;

CREATE VIEW region16p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 16;

CREATE VIEW region17a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 17;

CREATE VIEW region17t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 17;

CREATE VIEW region17p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 17;

CREATE VIEW region18a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 18;

CREATE VIEW region18t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 18;

CREATE VIEW region18p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 18;

CREATE VIEW region19a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 19;

CREATE VIEW region19t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 19;

CREATE VIEW region19p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 19;

CREATE VIEW region20a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 20;

CREATE VIEW region20t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 20;

CREATE VIEW region20p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 20;

CREATE VIEW region21a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 21;

CREATE VIEW region21t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 21;

CREATE VIEW region21p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 21;

CREATE VIEW region22a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 22;

CREATE VIEW region22t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 22;

CREATE VIEW region22p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 22;

CREATE VIEW region23a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 23;

CREATE VIEW region23t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 23;

CREATE VIEW region23p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 23;

CREATE VIEW region24a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 24;

CREATE VIEW region24t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 24;

CREATE VIEW region24p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 24;

CREATE VIEW region25a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 25;

CREATE VIEW region25t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 25;

CREATE VIEW region25p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 25;

CREATE VIEW region26a AS 
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = false and regions.id = 26;

CREATE VIEW region26t AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.temp_number IS NOT NULL and regions.id = 26;

CREATE VIEW region26p AS
						SELECT licence_applications.id, licence_applications.processed, licence_applications.subsidiary, 
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
					 WHERE licence_applications.processed = true AND licences.licence_type::text = 'p'::text and regions.id = 26;

