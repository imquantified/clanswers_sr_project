class QuickQuestionsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]

	def create
		@quick_question = current_user.quick_questions.build(question_params)
		if @quick_question.save
			flash[:success] = "Quick question created!"
			redirect_to :back
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
	end

	def show
		@user = current_user
		@quick_question = @user.quick_questions.build
		@feed_items = current_user.qq_feed.paginate(page: params[:page])
	end

	private

		def question_params
			params.require(:quick_question).permit(:content)
		end
end
