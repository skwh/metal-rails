class ApplicationController < ActionController::Base

	before_action :fetch_pages	

	def fetch_pages
		@pages = Page.all
	end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def locals(values)
  		render locals: values
	end
end
