class StaticPagesController < ApplicationController
	include StaticPagesHelper, ApplicationHelper
	before_action :begin_verification, only: [ :edit ]

	def login
	end

	def index
		locals data: Page.find_by_page_name("index")
	end

	def about
		locals data: Page.find_by_page_name("about")
	end

	def contact
		locals data: Page.find_by_page_name("contact")
	end

	def edit
		@data = Page.find_by_page_name(params[:page])
	end

	def page
		if params[:page] == "index"
			redirect_to root_path
		else
			locals data: Page.find_by_page_name(params[:page])
		end
	end

	def update
		@page = Page.find(params[:id])
		@page.rendered_text = markdown(params[:page][:input_text])
		if @page.update_attributes(page_params)
			redirect_to "/#{@page.page_name}"
		else
			render 'edit'
		end
	end

	private
		def page_params
			params.require(:page).permit(:title, :input_text, :rendered_text)
		end
end
