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
		@data = Page.find_by_page_name(params[:page_name])
	end


end
