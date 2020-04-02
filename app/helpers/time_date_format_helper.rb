module TimeDateFormatHelper

      def time_date_1(time)
            time.strftime("%a %b %d %H:%M:%S %Y")
      end
      
      def time_date_2(time)
            time.strftime("%d/%m/%y")
      end
	
	def time_date_3(time)
		time.strftime("%a %b %d %Y")
	end
	
	def time_date_4(time)
		time.strftime("%H:%M:%S")
	end
      
      def time_date_5(time)
		time.strftime("%d %b %Y")
	end
      
      def time_date_6(time)
            time.strftime("%d/%m")
      end
	
	def time_date_7(time)
		re = /(\d+)-(\d+)-(\d+)/
		date = re.match(time)
		time_date_2(Date.new(date[1].to_i, date[2].to_i, date[3].to_i))
	end

end