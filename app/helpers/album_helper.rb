module AlbumHelper
	def page_id(id)
		Album.find_by_page_id(id)
	end
end
