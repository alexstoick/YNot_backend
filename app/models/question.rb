class Question < ActiveRecord::Base

  has_one :answer


  # Scopes
  #

  default_scope {
    order("questions.created_at DESC")
  }

  scope :not_seen, -> () {
    where("questions.seen = false")
  }

  scope :seen, -> () {
    where("questions.seen = true")
  }
  scope :answered, -> {
    joins("join answers on answers.question_id = questions.id")
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
