class StaticPagesController < ApplicationController

  def home
  	if signed_in?
	  	@quick_question = current_user.quick_questions.build
	  	# @interest_question = current_user.interest_questions.build
	  	# @thoughtful_question = current_user.thoughtful_questions.build
  		#probably breaks
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
end
