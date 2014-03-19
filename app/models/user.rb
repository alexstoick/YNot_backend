class User < ActiveRecord::Base

  has_many :questions_posted,
    class_name: :Question,
    foreign_key: :poster_id

  has_many :questions_received,
    class_name: :Question,
    foreign_key: :receiver_id

end
