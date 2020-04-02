File.open("drop_views.sql", "w") do |write_file|
	
	for i in 0..0
		["a", "t", "p"].each do |type|
			view = "directors" + i.to_s + type
			write_file.puts "DROP VIEW #{view};"
		end
		["a", "t", "p"].each do |type|
			view = "countries" + i.to_s + type
			write_file.puts "DROP VIEW #{view};"
		end
	end
	
	for i in 0..26
		["a", "t", "p"].each do |type|
			view = "region" + i.to_s + type
			write_file.puts "DROP VIEW #{view};"
		end
	end
end