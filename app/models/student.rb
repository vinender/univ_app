class Student < ApplicationRecord

	before_save {self.email = email.downcase}
			
    validates :name, presence: true, length: {minimum: 3, maximum: 25}

    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { minimum: 12, maximum: 105},
	uniqueness: {case_sensitive: false},
	format: {with: VALID_EMAIL_REGEX}

end 
 