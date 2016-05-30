class Course < ActiveRecord::Base
  ratyrate_rateable 'scenery', 'clubhouse', 'conditions', 'worth'
  has_many :matches, dependent: :destroy
end
