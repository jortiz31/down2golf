class Match < ActiveRecord::Base
  belongs_to :course
  has_many :users, through: :usersmatches
  has_many :usersmatches
end
