class ThoughtfulQuestionsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]
	before_action :correct_user, only: :destroy

	def create
		@thoughtful_question = current_user.thoughtful_questions.build(question_params)
		if @thoughtful_question.save
			flash[:success] =  "Thoughtful question created!"
			redirect_to :back
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@thoughtful_question.destroy
		redirect_to :back
	end

	def show
		@thoughtful_question = current_user.thoughtful_questions.build
		@feed_items = current_user.tq_feed.paginate(page: params[:page])	
	end

	private

	    def question_params
	      params.require(:thoughtful_question).permit(:content)
	    end

	    def correct_user
    		@thoughtful_question = current_user.thoughtful_questions.find_by(id: params[:id])
    		redirect_to root_url if @thoughtful_question.nil?	    	
	    end
end
