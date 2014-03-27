class QuestionsController < ApplicationController
  before_action :authenticate

  # GET questions/:id
  #
  def show
    question = Question.find(params[:id])
    render json: question
  end

  # POST users/:user_id/questions
  #
  def create
    user = User.find(params[:user_id])
    q = Question.new(
        receiver_id: params[:receiver_id],
        question: params[:question],
        property_sent: false
      )
    user.questions_posted << q
    q.save!

    render json: q
  end

  # POST questions/:question_id/sent
  #
  def sent
    question = Question.find(params[:question_id])
    question.property_sent = true
    # question.save!
    render json: { "sucess" => true }
  end

  private
  def post_params
    params.require(:receiver_id).permit(:question)
  end
end
