class Match < ActiveRecord::Base
  ratyrate_rateable 'company', 'fun_factor', 'competitiveness', 'play_again'
  belongs_to :course
  has_many :users, through: :usersmatches, dependent: :destroy
  has_many :usersmatches, class_name: Usermatch, dependent: :destroy
end
