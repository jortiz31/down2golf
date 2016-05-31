class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ratyrate_rater
  acts_as_messageable
  mount_uploader :gravatar, GravatarUploader
  ratyrate_rateable 'Humor', 'Skill_level', 'Sociability'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :matches, through: :usersmatches, dependent: :destroy
  has_many :usersmatches, class_name: Usermatch, dependent: :destroy
  def mailboxer_email(object)
    email
  end
end
