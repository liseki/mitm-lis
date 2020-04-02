class Search
  
	attr_accessor			:lic_or_app1, :lic_or_app2, :lic_or_app3, :time_range, :main_cat, :sub_cat, :element, 
							:business_type, :investment_type, :input1, :input2, :range1, :range2, :licence_type, 
							:region, :district, :ward, :search_report, :country
	
	
      START_YEAR =          1990
	END_YEAR = 		2010
      
	ITEM0 = 			[["Unprocessed Application", "a"], ["Temporary Licence", "t"], ["Permanent Licence", "p"]].freeze
	
	ITEM = 				[["Applications", 1], ["Licences", 2]].freeze
	
	TIME_RANGE1 = 		[["-- select --", 0], ["today", 1], ["yesterday", 2], ["this week", 3], ["this month", 4], 
							["past 3 months", 5], ["past 6 months", 6]].freeze
						
	BUSINESS_TYPE = 	[["Any", "___"], ["Ltd Company", "ltd"], ["Proprietorship", "cmp"], ["Individual", "ind"]].freeze
	
	INVESTMENT_TYPE = [["Any", "___"], ["Local", "loc"], ["Joint Venture", "jnt"], ["Foreign Owned", "for"]].freeze
	
	FOREIGN_TYPE =		[["All", "___"], ["Joint Venture", "jnt"], ["Foreign Owned", "for"]].freeze
	
	LOCAL_TYPE = 		[["All", "___"], ["Local", "loc"], ["Joint Venture", "jnt"]].freeze
	
	ELEMENTS = 		[["Company Name", 1], ["TIN", 2], ["Inc/Reg #", 3], ["Director Name", 4]].freeze
      
      LICENCES = 			[["Perm Licences", "p"], ["Temp Licences", "t"]].freeze
	
	LICENCES_LONG = 	[["Permanent Licences", "p"], ["Temporary Licences", "t"]].freeze
	
	GRAPH_OPTION1 = 	[["Include both graphs", 1], ["Include graph 1 only", 2], ["Include graph 2 only", 3], 
							["Remove both graphs", 4]].freeze
	
	GRAPH_OPTION2 = 	[["Include graph", 5], ["Remove graph", 6]].freeze
	
	SEARCH_REPORT = 	[["Summary", 1], ["Company info", 2], ["Application info", 3]].freeze

end