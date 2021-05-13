class Comment < ApplicationRecord
  belongs_to :new
  validates :content, presence: true
end
