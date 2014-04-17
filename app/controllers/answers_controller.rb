class AnswersController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]
	before_action :correct_user, only: :destroy

	def create
		@answer = current_user.answers.build(answer_params)
		if @answer.save
			flash[:success] = "Answer created!"
			redirect_to :back
		else
			@feed_items = []
			redirect_to :back
			flash[:danger] = "Unsuccessful :("
		end
	end

	def destroy
		@answer.destroy
		redirect_to :back
	end

	def show
		@answer = current_user.answers.build
		@feed_items = current_user.qa_feed.paginate(page: params[:page])
		# @quick_answer_build = current_user.answers.build(answer_params)
	end	

	def showall
		@answer = current_user.answers.build
		@feed_items = current_user.all_answer_feed.paginate(page: params[:page])
	end

	private

		def answer_params
			params.require(:answer).permit(:content)
		end

		def correct_user
    		@answer = current_user.answers.find_by(id: params[:id])
    		redirect_to root_url if @answer.nil?
    	end
end
