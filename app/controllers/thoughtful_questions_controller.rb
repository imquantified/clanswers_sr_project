class ThoughtfulQuestionsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]

	def create
		@thoughtful_question = current_user.thoughtful_questions.build(question_params)
		if @thoughtful_question.save
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
	      params.require(:thoughtful_question).permit(:content)
	    end
end
