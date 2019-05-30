class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: (1..5) }, numericality: true
  validates :user, uniqueness: { scope: :book, message: "has already reviewed this book"}

  def self.ordered_by_date
    order(created_at: :desc)
  end
end
