# Roles
roles = ['admin', 'moderator', 'user']

roles.each do |role|
  Role.new(name: role).save
end

# Users
admin = User.new
admin.email = 'admin@gmail.com'
admin.password = '132456789'
admin.save
admin.roles << Role.where(name: 'admin').first

# Countries

countries = ['USA', 'UK', 'France', 'Italy', 'Russia', 'Japan']

countries.each do |country|
  Country.new(name: country).save
end

# Genres

genres = ['Action', 'Adventure', 'Animation', 'Biography', 'Comedy', 'Crime', 'Documentary', 'Drama', \
          'Family', 'Fantasy', 'Film-Noir', 'Game-Show', 'History Horror', 'Music', 'Musical', 'Mystery', 'News', \
          'Reality-TV', 'Romance', 'Sci-Fi', 'Sport', 'Talk-Show', 'Thriller', 'War', 'Western']

genres.each do |genre|
  Genre.new(name: genre).save
end

# Professions

professions = ['actor', 'screenwriter', 'director', 'producer']

professions.each do |profession|
  Profession.new(name: profession).save
end


# Movies

number = 1
min_age = 1
length = 30
budget = 10000
release_date = 1980

20.times do
  Movie.new do |m|
    m.name = 'Movie' + number.to_s
    m.min_age = min_age
    m.length = length
    m.budget = budget
    m.release_date = release_date
  end.save

  number += 1
  min_age +=1
  length += 10
  budget += 5000
  release_date +=1
end