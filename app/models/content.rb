class Content < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
end
