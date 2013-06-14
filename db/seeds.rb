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

20.times do
  Movie.new do |m|
    m.name = 'Movie' + number.to_s
    m.poster = posters.sample
    m.min_age = min_age
    m.length = length
    m.budget = budget
    m.release_date = release_date
    m.country = Country.where(name: countries.sample).first
    2.times { m.genres << Genre.where(name: genres.sample).first }
  end.save

  number += 1
  min_age +=1
  length += 10
  budget += 5000
  release_date +=1
end