class Question < ActiveRecord::Base

  has_one :answer


  # Scopes
  #

  default_scope {
    order("questions.created_at DESC")
  }

  scope :not_sent, -> () {
    where("questions.property_sent = false")
  }

  # Instance methods
  #

  def has_answer
    ! answer.nil?
  end

  # Class methods
  #

  def self.answered_bla
    Question.all.select { |q| q.has_answer}
  end

end
