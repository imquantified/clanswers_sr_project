class InterestQuestionsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]
	before_action :correct_user, only: :destroy

	def create
		@interest_question = current_user.interest_questions.build(question_params)
		if @interest_question.save
			flash[:success] = "Interest question created!"
			redirect_to :back
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@interest_question.destroy
		redirect_to :back
	end

	def show
		@interest_question = current_user.interest_questions.build
		@feed_items = current_user.iq_feed.paginate(page: params[:page])
	end

	private

		def question_params
      		params.require(:interest_question).permit(:content)
    	end

    	def correct_user
    		@interest_question = current_user.interest_questions.find_by(id: params[:id])
    		redirect_to root_url if @interest_question.nil?
    	end
end
