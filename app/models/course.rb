class Course < ApplicationRecord

	validates :name, presence: true, length: {minimum: 5, maximum: 25}
    validates :short_name, presence: true, length: {minimum: 3, maximum: 10}
    validates :description, presence: true, length: {minimum: 50, maximum: 300}
    has_many :student_courses
    has_many :students, through: :student_courses

end 