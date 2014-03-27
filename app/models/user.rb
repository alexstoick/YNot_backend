class User < ActiveRecord::Base

  # Relationships
  #

  has_many :questions_posted,
    class_name: :Question,
    foreign_key: :poster_id

  has_many :questions_received,
    class_name: :Question,
    foreign_key: :receiver_id

  has_many :answers,
    through: :questions_posted,
    class_name: :Answer

  # Callbacks
  #

  before_create :set_auth_token



  # Private functions
  #

  private
  def set_auth_token
    return if auth_token.present?

    begin
      self.auth_token = SecureRandom.hex
    end while self.class.exists?(auth_token: self.auth_token)
  end

end
