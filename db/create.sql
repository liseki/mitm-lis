 create table users (
	id					serial,
	pword				char(40)				not null,
	email				varchar(50)				not null,
	first_name			varchar(20)				not null,
	surname				varchar(20)				not null,
	user_type			int						not null,
	primary key (id)
);


create table categories (
	id					serial,
	name				varchar(50)				not null,
	parent_id			int,
	constraint			fk_category				foreign key (parent_id)			references categories(id),
	primary key (id)
);

create table licences (
	id					serial,
	category_id			int						not null,
	user_id				int,
	constraint			fk_application_category	foreign key (category_id)		references categories(id),
	constraint			fk_application_user		foreign key (user_id)			references users(id),
	primary key (id)
);


create table applications (
	id 					serial,
	category_id			int						not null,
	user_id				int,
	constraint			fk_application_category	foreign key (category_id)		references categories(id),
	constraint			fk_application_user		foreign key (user_id)			references users(id),
	primary key (id)
);


create table companies (
	id					serial,
	application_id		int,
	licence_id			int,
	cert_of_inc_no		varchar(10),
	name				varchar(200)			not null,
	business_type		int						not null,
	investment_type		char(3)					not null,
	holders_citizenship	int [4]					not null,
	constraint 			fk_company_application 	foreign key (application_id) 		references applications(id),
	constraint 			fk_company_licence 		foreign key (licence_id) 			references licences(id),
	primary key (id)
);
create index idx_companies_name on companies(name);
create index idx_companies_investment_type on companies(investment_type);


create table directors (
	id					serial,
	company_id			int						not null,
	first_name			varchar(20)				not null,
	surname				varchar(20)				not null,
	constraint 			fk_directors_company 	foreign key (company_id) 		references companies(id),
	primary key (id)
);
create index idx_directors_company on directors(company_id);


create table tins (
	id 					serial,
	company_id			int						not null,
	tin_number			char(9)					not null,
	constraint 			fk_tin_company 			foreign key (company_id) 		references companies(id),
	primary key (id)
);
create index idx_tins_company on tins(company_id);


create table regions (
	id					serial,
	name				varchar(25)				not null,
	primary key (id)
);


create table districts (
	id					serial,
	region_id			int						not null,
	name				varchar(25)				not null,
	constraint 			fk_district_region 		foreign key (region_id) 			references regions(id),
	primary key (id)
);
create index idx_districts_region on districts(region_id, name);


create table addresses (
	id					serial,
	district_id			int						not null,
	company_id			int						not null,
	p_o_box				int,
	telephone			varchar(10),
	fax					varchar(10),
	email				varchar(50),
	block				varchar(8),
	house_no			varchar(5),
	plot_no				int,
	street				varchar(30),
	ward			      varchar(20),				
	constraint			fk_address_district		foreign key (district_id)			references districts(id),
	constraint 			fk_address_company 		foreign key (company_id) 		references companies(id),
	primary key (id)
);
create index idx_addresses_company on addresses(company_id);
create index idx_addresses_district on addresses(district_id);