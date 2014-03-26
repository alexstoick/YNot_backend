class QuestionsController < ApplicationController
  # POST users/:users_id/questions
  #
  def create
    user = User.find(params[:user_id])
    q = Question.new(
        receiver_id: params[:receiver_id],
        question: params[:question],
        seen: false
      )
    user.questions_posted << q
    q.save!

    render json: q
  end

  private
  def post_params
    params.require(:receiver_id).permit(:question)
  end
end
