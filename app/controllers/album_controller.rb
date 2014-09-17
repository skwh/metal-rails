class AlbumController < ApplicationController

	def album
		@album = Album.find_by_id(params[:id])
	end

	def edit
		@album = Album.find_by_id(params[:id])
	end

	def update
		@album = Album.find_by_id(params[:id])
		if @album.update_attributes(album_params)
			redirect_to "/#{@album.page.page_name}"
		else
			render 'edit'
		end
	end

	def destroy
		@album = Album.find_by_id(params[:id])
		@album.destroy
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.create(album_params)
		if @album.save
			flash[:success] = "Album Created."
			redirect_to album_path(@album)
		else
			render "new"
		end
	end

	private
		def album_params
			params.require(:album).permit(:title, :description, :images_attribues => [:url, :subtitle])
		end

end
