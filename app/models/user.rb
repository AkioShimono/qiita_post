class User < ApplicationRecord
  has_many :contents, dependent: :destroy
  before_save { self.email.downcase! }
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :qiita_token, presence: true, uniqueness: true

  has_secure_password
end
