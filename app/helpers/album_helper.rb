module AlbumHelper
	def get_parent_page(page_id)
		Page.find(page_id)
	end
end
