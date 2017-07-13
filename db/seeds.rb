# seed database with users
7.times do |n|
    uid = Faker::Number.number(10)
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    thoughts = Faker::Lorem.sentences
    User.create(uid: uid, name: name, image_url: gravatar_url, thoughts: thoughts)
end

# seed database with user recommendations
@users = User.all

@users.each do |user|
    2.times do
        title = Faker::Book.title
        @books = GoogleBooks.search(title, {count: 1})
        @books.each do |book|
            user.books.create(title: book.title, author: book.authors, pages: book.page_count, info: book.info_link, image: book.image_link, rating: book.ratings_count)
        end
    end
end

# seed database with user relationships, i.e. A follows B
@follower = User.all
@followed = User.all

@follower.each do |follower|
    @followed.each do |followed|
        next if follower.id == followed.id or follower.following.include?(followed)
        follower.following << followed
    end
end