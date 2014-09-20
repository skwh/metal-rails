class Image < ActiveRecord::Base
	belongs_to :album

	validates_presence_of :url

	def parent_album
		Album.find_by_id(album_id)
	end
end
