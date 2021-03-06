module ApplicationHelper

	def title_helper(page_title)
		base_title = "Clanswers"
		if page_title.empty?
			base_title
		else
			"#{base_title} - #{page_title}"
		end
	end


  def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(" ")))
  end

  private

    def wrap_long_string(text, max_width = 35)
      zero_width_space = " "
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text :
                                  text.scan(regex).join(zero_width_space)
    end
end
