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

  scope :sent, -> () {
    where("questions.property_sent = true")
  }
  scope :answered, -> {
    joins("join answers on answers.question_id = questions.id")
  }

  scope :not_answered, -> {
    joins("right outer join answers on answers.question_id = questions.id")
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
