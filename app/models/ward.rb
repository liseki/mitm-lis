class Ward < ActiveRecord::Base
      
      belongs_to                  	:district
      has_many                      	:addresses, :dependent => false
      
end
