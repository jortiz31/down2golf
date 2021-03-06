class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ratyrate_rater
  acts_as_messageable
  devise :omniauthable, :omniauth_providers => [:facebook]
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
  def update_with_password(params, *options)
    current_password = params.delete(:current_password)
  if params[:password].blank?
    params.delete(:password)
    params.delete(:password_confirmation) if params[:password_confirmation].blank?
  end
  result = if params[:password].blank? || valid_password?(current_password)
    update_attributes(params, *options)
  else
    self.assign_attributes(params, *options)
    self.valid?
    self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
    false
  end
    clean_up_passwords
    result
  end
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
