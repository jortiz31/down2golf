class Match < ActiveRecord::Base
  belongs_to :course
  has_many :users, through: :usersmatches
  has_many :usersmatches, class_name: Usermatch
end
