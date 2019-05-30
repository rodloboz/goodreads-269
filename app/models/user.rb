class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews

  def full_name
    "#{first_name} #{last_name}"
  end

  def reviewed_book?(book)
    reviews.where(book: book).any?
  end
end
