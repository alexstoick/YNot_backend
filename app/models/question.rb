class Question < ActiveRecord::Base

  has_one :answer

  default_scope { order("questions.created_at DESC") }
  # Scopes
  scope :not_seen, -> () {
    where("questions.seen = false")
  }

  scope :seen, -> () {
    where("questions.seen = true")
  }
end
