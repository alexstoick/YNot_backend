class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user.to_json(
        only: :device_token ,
        :include => [
          :questions_posted => {
            only: [:question , :created_at ],
            methods: [ :not_seen ],
            :include => [
              :answer => {
                only: [:answer],
                methods: [:not_seen]
              }
            ]
          }
        ]
      )
  end

  def create
  end
end
