class Content < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
end
