class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end
end
