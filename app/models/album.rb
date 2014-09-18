class Album < ActiveRecord::Base
	include AlbumHelper
	has_many :images
	accepts_nested_attributes_for :images
	
	def parent_page
		get_parent_page(page_id)
	end
end
