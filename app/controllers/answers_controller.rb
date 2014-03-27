class AnswersController < ApplicationController

  before_action :authenticate

  # GET /answers
  def index
    answers = @current_user.answers
    render json: answers
  end

  # POST questions/:question_id/answer
  #
  def create

    question = Question.find(params[:question_id])
    answer = Answer.new(
      body: params[:answer],
      question_id: params[:question_id]
    )
    question.answer = answer
    question.touch
    answer.save!
    render json: answer

  end

end
