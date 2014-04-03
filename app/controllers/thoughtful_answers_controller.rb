class ThoughtfulAnswersController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]
	before_action :correct_user, only: :destroy

	def create
		@thoughtful_answer = current_user.thoughtful_answers.build(answer_params)
		if @thoughtful_answer.save
			flash[:success] = "Thoughtful answer created!"
			redirect_to :back
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@thoughtful_answer.destroy
		redirect_to :back
	end

	def show
		@thoughtful_answer = current_user.thoughtful_answers.build
		@feed_items = current_user.ta_feed.paginate(page: params[:page])
	end

	private

		def answer_params
			params.require(:thoughtful_answer).permit(:content)
		end

		def correct_user
    		@thoughtful_answer = current_user.thoughtful_answers.find_by(id: params[:id])
    		redirect_to root_url if @thoughtful_answer.nil?
    	end
end