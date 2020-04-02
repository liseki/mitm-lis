File.open("regions_districts_wards.sql", "w") do |write_file|
File.open("regions_districts_wards.txt", "r") do |read_file|
	region_name = ''
	region = district_all = ward_all = 0
	district_loc = region_wards = ward_loc = 0
	count = 0
	while line = read_file.gets
		count += 1
		puts "starting...\n\n" if count == 1
		if !line.chomp!.empty? && line[3] != 35                   ### line is note empty or separator (see regions_districts_wards.txt!)
			line = line.gsub(/'/, '\'\'')					### escape apostrophes
			if line[0] == 114								### it's a region!
				write_file.puts "\n\n" if count > 1
				write_file.puts "-------------------------------------------------------------------------------" if count > 1
				write_file.puts "\n\n" if count > 1
				line = line.gsub(/^\s*r\s*/, '')
				write_file.puts "INSERT INTO regions (name) VALUES ('#{line}');"
				puts "#{region}. #{region_name} Region - #{district_loc} districts and #{region_wards} wards." if count > 1
				region_name = line; region += 1; district_loc = 0; region_wards = 0
			elsif line[0] == 100							### it's a district
				line = line.gsub(/^\s*d\s*/, '')
				write_file.puts "\nINSERT INTO districts (name, region_id) VALUES ('#{line}', #{region});"
				district_all += 1; district_loc += 1; ward_loc = 0
			elsif line[0] == 119							### it's a ward
				line = line.gsub(/^\s*w\s*/, '')
				write_file.puts "INSERT INTO wards (name, district_id) VALUES ('#{line}', #{district_all});"
				region_wards += 1; ward_all += 1; ward_loc += 1;
			end
		end
	end
	puts "#{region}. #{region_name} Region - #{district_loc} districts and #{region_wards} wards."
	puts "\n...finished! #{region} regions, #{district_all} districts and #{ward_all} wards.\n\n"
end end