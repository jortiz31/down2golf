class Comment < ActiveRecord::Base
  belongs_to :course
  belongs_to :match
  belongs_to :user
end
