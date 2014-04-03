class InterestAnswersController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy, :show]
	before_action :correct_user, only: :destroy

	def create
		@interest_answer = current_user.interest_answers.build(answer_params)
		if @interest_answer.save
			flash[:success] = "Interest answer created!"
			redirect_to :back
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@interest_answer.destroy
		redirect_to :back
	end

	def show
		@interest_answer = current_user.interest_answers.build
		@feed_items = current_user.ia_feed.paginate(page: params[:page])
	end

	private

		def answer_params
			params.require(:interest_answer).permit(:content)
		end

		def correct_user
    		@interest_answer = current_user.interest_answers.find_by(id: params[:id])
    		redirect_to root_url if @interest_answer.nil?
    	end
end