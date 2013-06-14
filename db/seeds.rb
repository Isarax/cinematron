# Roles
roles = ['admin', 'moderator', 'user']

roles.each do |role|
  Role.new(name: role).save
end

# Users
admin = User.new
admin.name = 'Admin'
admin.email = 'admin@gmail.com'
admin.password = '123456789'
admin.role = Role.where(name: 'admin').first
admin.save


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

# People

(tarantino = Person.new do |p|
  p.first_name = 'Quentin'
  p.middle_name = 'Jerome'
  p.last_name = 'Tarantino'
  p.country = Country.where(name: 'USA').first
end).save

# Movies

number = 1
min_age = 1
length = 30
budget = 10000
release_date = 1980
posters = [
'http://glowgaze.com/forum/attachment.php?attachmentid=17404&d=1371048814',
'http://glowgaze.com/forum/attachment.php?attachmentid=17369&d=1370642679',
'http://glowgaze.com/forum/attachment.php?attachmentid=17288&d=1370328752',
'http://glowgaze.com/forum/attachment.php?attachmentid=17097&d=1368547409',
'http://glowgaze.com/forum/attachment.php?attachmentid=17077&d=1369689183',
'http://glowgaze.com/forum/attachment.php?attachmentid=13721&d=1366705165',
'http://glowgaze.com/forum/attachment.php?attachmentid=13554&d=1366559822',
'http://glowgaze.com/forum/attachment.php?attachmentid=13326&d=1362904986',
'http://glowgaze.com/forum/attachment.php?attachmentid=13219&d=1365718976',
'http://glowgaze.com/forum/attachment.php?attachmentid=10958&d=1364285250',
'http://glowgaze.com/forum/attachment.php?attachmentid=9029&d=1358549348',
'http://glowgaze.com/forum/attachment.php?attachmentid=8860&d=1357121812',
'http://glowgaze.com/forum/attachment.php?attachmentid=6691&d=1358203320',
'http://glowgaze.com/forum/attachment.php?attachmentid=6046&d=1356931494']

trailer = 'http://www.youtube.com/watch?v=dQw4w9WgXcQ'
info = %Q{ Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor \
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud \
          exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute \
          irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla \
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia \
          deserunt mollit anim id est laborum. }

20.times do
  Movie.new do |m|
    m.name = 'Movie' + number.to_s
    m.poster = posters.sample
    m.trailer = trailer
    m.min_age = min_age
    m.length = length
    m.budget = budget
    m.release_date = release_date
    m.country = Country.where(name: countries.sample).first
    m.info = info
    2.times { m.genres << Genre.where(name: genres.sample).first }
  end.save

  number += 1
  min_age +=1
  length += 10
  budget += 5000
  release_date +=1
end

# Creators
Movie.all.each do |m|
  Profession.all.each do |p|
    Creator.new do |c|
      c.movie = m
      c.profession = p
      c.person = tarantino
    end.save
  end
end
