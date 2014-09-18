module ApplicationHelper
	def title_helper(title)
		base_title = "Metalithic Ironworks"
		if title.empty?
			base_title
		else
			"#{base_title} | #{title}"
		end
	end

	def check_password(pw)
		master_pw_digest = Password.first.password_digest.to_s
		given_pw_digest = Digest::SHA1.hexdigest pw.to_s
		if given_pw_digest == master_pw_digest
			true
		else
			false
		end
	end

	def store_location
    	session[:return_to] = request.url
  	end

  	def logged_in?
  		session[:verified]
  	end

  	def markdown(text) #transforms the markdown text to html
		markdown_obj = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    :autolink => true, :space_after_headers => true)
		return markdown_obj.render(text)
	end

	def pages_to_catergories
		cats = []
		Page.all.each do |p|
			cats.push([p.caps_name,p.id])
		end
		return cats
	end
	
end
