module ApplicationHelper
	def title_helper(title)
		base_title = "Metalithic Ironworks"
		if title.empty?
			base_title
		else
			"#{base_title} | #{title}"
		end
	end
end
