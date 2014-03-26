class AnswersController < ApplicationController
  def create

    question = Question.find(params[:question_id])
    answer = Answer.new(
      answer: params[:answer],
      seen: false,
    )
    question.answer = answer
    answer.save!
    render json: answer

  end

  private
  def post_params
    params.require(:receiver_id)
  end
end
