class Image < ActiveRecord::Base
	belongs_to :album

	def parent_album
		Album.find_by_id(album_id)
	end
end
