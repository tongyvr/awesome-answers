class Product < ActiveRecord::Base
  # Find all products priced more than 100 and less than 300. Order them by name and limit the results to 10 products.
 def self.find_price
   where("price > 100 AND price < 300")
 end
# Find all the users whose neither first_name nor last_name is "john"

end
