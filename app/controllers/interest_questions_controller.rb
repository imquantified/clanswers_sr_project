class InterestQuestionsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]

	def create
		@interest_question = current_user.interest_questions.build(question_params)
		if @interest_question.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
	end

	def show
	end

	private

		def question_params
      		params.require(:interest_question).permit(:content)
    	end
end
