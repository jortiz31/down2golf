class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ratyrate_rater
  acts_as_messageable
  ratyrate_rateable 'Humor', 'Skill_level', 'Sociability'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :matches, through: :usersmatches, dependent: :destroy
  has_many :usersmatches, class_name: Usermatch, dependent: :destroy
end
