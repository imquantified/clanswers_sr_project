class QuickAnswersController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]
	before_action :correct_user, only: :destroy

	def create
		@quick_answer = current_user.quick_answers.build(answer_params)
		if @quick_answer.save
			flash[:success] = "Quick answer created!"
			redirect_to :back
		else
			@feed_items = []
			redirect_to root_path
			flash[:danger] = "Unsuccessful :("
		end
	end

	def destroy
		@quick_answer.destroy
		redirect_to :back
	end

	def show
		@quick_answer = current_user.quick_answers.build
		@feed_items = current_user.qa_feed.paginate(page: params[:page])
		# @quick_answer_build = current_user.quick_answers.build(answer_params)
	end

	private

		def answer_params
			params.require(:quick_answer).permit(:content)
		end

		def correct_user
    		@quick_answer = current_user.quick_answers.find_by(id: params[:id])
    		redirect_to root_url if @quick_answer.nil?
    	end
end
