class Comment < ActiveRecord::Base
  belongs_to :course
  belongs_to :match
  belongs_to :user
  validates :body, length: { maximum: 25 }
  validates :subject, length: { maximum: 75 }
end
