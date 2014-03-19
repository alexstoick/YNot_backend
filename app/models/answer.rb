class Answer < ActiveRecord::Base

  belongs_to :question

  default_scope { order("questions.created_at DESC") }
  # Scopes
  scope :not_seen, -> () {
    where("answers.seen = false")
  }

  scope :seen, -> () {
    where("answers.seen = true")
  }
end
