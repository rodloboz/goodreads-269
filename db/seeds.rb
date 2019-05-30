require "open-uri"
require "yaml"

Review.destroy_all
Book.destroy_all
Author.destroy_all
User.destroy_all

file = "https://raw.githubusercontent.com/rodloboz/lw-fullstack/master/goodreads/data/books.yml"
sample = YAML.load(open(file).read)

puts 'Creating users...'
users = {}
sample["users"].each do |user|
  users[user["slug"]] = User.create! user.except("slug")
end

puts 'Creating authors...'
authors = {}
sample["authors"].each do |author|
  authors[author["slug"]] = Author.create! author.except("slug")
end

puts 'Creating books...'
books = {}
sample["books"].each do |book|
  author = authors[book["author_slug"]]
  books[book["slug"]] = Book.create! book.except("slug", "author_slug").merge(author: author)
end

puts 'Creating reviews...'
sample["reviews"].each do |review|
  user = users[review["user_slug"]]
  book = books[review["book_slug"]]
  Review.create! review.slice("rating", "content").merge(user: user, book: book)
end

puts 'Finished!'
