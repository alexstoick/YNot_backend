class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    questions_posted_object = user.questions_posted.answered.not_seen.pluck(:id,:body,:created_at).as_json
    # render json: {
    #   device_token: user.device_token,
    #   questions_posted: questions_posted_object
    # }
    # return
    render json: user.to_json(
        only: :device_token ,
        :include => {
          :questions_posted => {
            only: [ :id , :body , :created_at  , :seen ],
            methods: [ :not_seen , :answered , :has_answer, :answer_text ],
            :include => [
              :answer => {
                only: [:body],
                methods: [:not_seen]
              }
            ]
          },
          :questions_received => {
            only: [:id, :body, :created_at ],
            methods: :not_seen
          }
        }
      )
  end

  def create

    phone_number = post_params[:phone_number]
    device_token = post_params[:device_token]

    user = User.where(phone_number: phone_number).first_or_initialize(
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
