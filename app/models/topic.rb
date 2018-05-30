class Topic < ApplicationRecord
  belongs_to :sub
  has_many :comments, dependent: :destroy
  validates :name, :body, presence: true
end
