# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

7.times do |n|
    uid = Faker::Number.number(10)
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    thoughts = Faker::Lorem.sentence(3)
    User.create(uid: uid, name: name, image_url: gravatar_url, thoughts: thoughts)
end

@users = User.all

@users.each do |user|
    1.times do
        title = Faker::Book.title
        @books = GoogleBooks.search(title, {count: 1})
        @books.each do |book|
            user.books.create(title: book.title, author: book.authors, pages: book.page_count, info: book.info_link, image: book.image_link, rating: book.ratings_count)
        end
    end
end