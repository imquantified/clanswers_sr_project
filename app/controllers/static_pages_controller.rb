class StaticPagesController < ApplicationController

  def home
  	if signed_in?
	  	@question = current_user.questions.build
  		
  		#Only queries Quickquestion feed at this time
  		@feed_items = current_user.all_question_feed.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
end
