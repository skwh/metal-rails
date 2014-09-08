class StaticPagesController < ApplicationController

	def index
		locals data: Page.find_by_page_name("index")
	end

	def about
		locals data: Page.find_by_page_name("about")
	end

	def contact
		locals data: Page.find_by_page_name("contact")
	end

end
