class Content < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true, uniqueness: { scope: :user_id }
end
