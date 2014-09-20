class AlbumController < ApplicationController
	include StaticPagesHelper, ApplicationHelper
	before_action :begin_verification, only: [ :edit, :update, :destroy, :new, :create]

	def album
		@album = Album.find_by_id(params[:id])
	end

	def edit
		@album = Album.find_by_id(params[:id])
	end

	def update
		@album = Album.find_by_id(params[:id])
		if @album.update_attributes(album_params)
			flash[:success] = "Album updated."
			redirect_to album_path(@album)
		else
			flash[:error] = "There was a problem."
			render 'edit'
		end
	end

	def destroy
		@album = Album.find_by_id(params[:id])
		@album.destroy
		flash[:success] = "Album destroyed."
		redirect_to "/"
	end

	def new
		@album = Album.new
		2.times { @album.images.build }
	end

	def create
		@album = Album.create(album_params)
		if @album.save
			flash[:success] = "Album Created."
			redirect_to album_path(@album)
		else
			flash[:error] = "There was a problem."
			render "new"
		end
	end

	private
		def album_params
			params.require(:album).permit(:title, :description, :page_id, images_attributes: [:id, :url, :subtitle, :_destroy])
		end

end
