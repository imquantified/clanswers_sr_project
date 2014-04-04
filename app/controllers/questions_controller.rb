class QuestionsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]
	before_action :correct_user, only: :destroy

	def create
		@question = current_user.questions.build(question_params)
		if @question.save
			flash[:success] = "Quick question created!"
			redirect_to :back
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@question.destroy
		redirect_to :back
	end

	def show
		@question = current_user.questions.build
		@feed_items = current_user.qq_feed.paginate(page: params[:page])
	end

	private

		def question_params
			params.require(:question).permit(:content)
		end

		def correct_user
    		@question = current_user.questions.find_by(id: params[:id])
    		redirect_to root_url if @question.nil?
    	end
end
