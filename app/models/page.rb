class Page < ActiveRecord::Base
	has_many :albums

	def caps_name
		page_name.capitalize
	end
end
