class Match < ActiveRecord::Base
  belongs_to :course
  has_many :users, through: :usersmatches, dependent: :destroy
  has_many :usersmatches, class_name: Usermatch, dependent: :destroy
end
