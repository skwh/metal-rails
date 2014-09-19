class Album < ActiveRecord::Base
	has_many :images
	accepts_nested_attributes_for :images, allow_destroy: true
	
	def parent_page
		Page.find_by_id(page_id)
	end
end
