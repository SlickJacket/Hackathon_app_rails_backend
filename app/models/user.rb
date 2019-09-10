class User < ApplicationRecord
    has_secure_password
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, uniqueness: true
    has_many :user_skills
    has_many :skills, through: :user_skills
end
