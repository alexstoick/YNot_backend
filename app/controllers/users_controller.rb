class UsersController < ApplicationController

  before_action :authenticate, only: :show

  # GET /users/:id
  #
  def show

    user = @current_user
    questions_received_object = user.questions_received.not_sent.select("questions.id, questions.body, questions.created_at").includes(:answer)
    questions_received = []

    questions_received_object.each do |question|
      current_question = {}
      current_question[:id] = question.id
      current_question[:body] = question.body
      current_question[:created_at] = question.created_at
      current_question[:has_answer] = question.has_answer
      questions_received << current_question
    end

    render json: {
      device_token: user.device_token,
      questions: questions_received
    }
  end

  # POST /users
  #
  def create

    phone_number = post_params[:phone_number]
    device_token = post_params[:device_token]
    user = User.where(
        phone_number: phone_number
      ).first_or_initialize(
        device_token: device_token
      )
    user.save!

    render json: user.to_json(
        only: [:id,:device_token]
    )
  end

  private
  def post_params
    params.require(:phone_number).permit(:device_token)
  end
end
