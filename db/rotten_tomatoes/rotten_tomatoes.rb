class RottenTomatoes
  require 'net/http'
  require 'json'

  ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
  require File.expand_path(File.dirname(__FILE__) + "../../../config/environment")

  @@site = 'http://api.rottentomatoes.com/api/public/v1.0'
  @@api_key = '.json?apikey=8eerxqsuqspnt3ma2rpem5mn'

  def self.json_request(request, options = {})
    uri = @@site + request + @@api_key
    options.each do |k, v|
      uri.concat('&' + k + '=' + v)
    end
    response = Net::HTTP.get(URI uri)
    JSON.parse(response)
  end

  def self.find_movie(id)
    json_request('/movies/' + id.to_s)
  end

  def self.find_movie_cast(id)
    json_request('/movies/' + id.to_s + '/cast')
  end

  def self.leech_movie(id)
    response = RottenTomatoes.find_movie(id)
    if response['id']
      movie = Movie.new do |m|
        m.name = response['title']
        m.poster = response['posters']['original']
        m.trailer = 'http://www.youtube.com/watch?v=dQw4w9WgXcQ'
        mpaa_to_min_age = { 'G' => 0, 'PG' => 6, 'PG-13' => 13, 'R' => 17, 'NC-17' => 17 }
        m.min_age = mpaa_to_min_age[response['mpaa_rating']]
        m.length = response['runtime']
        m.release_date = Date.parse(response['release_dates']['theater'])
        m.info = response['critics_consensus']
        m.country = Country.find_or_create_by_name(name: 'USA')
      end
      movie.save

      response['genres'] && response['genres'].each do |genre|
        movie.genres << Genre.find_or_create_by_name(name: genre)
      end

      response['abridged_directors'] && response['abridged_directors'].each do |director|
        name = director['name'].split(' ')
        Creator.new do |c|
          c.movie = movie
          c.person = Person.find_or_create_by_first_name_and_last_name(first_name: name[0], last_name: name[1])
          c.profession = Profession.find_or_create_by_name(name: 'director')
        end.save
      end

      cast_response = find_movie_cast(id)
      cast_response['cast'] && cast_response['cast'].each do |member|
        name = member['name'].split(' ')
        Creator.new do |c|
          c.movie = movie
          c.person = Person.find_or_create_by_first_name_and_last_name(first_name: name[0], last_name: name[1])
          c.profession = Profession.find_or_create_by_name(name: 'actor')
        end.save
      end
    end
  end

  def self.leech(id, number)
    while number > 0 do
      if leech_movie(id)
        number -= 1
        puts "Movie with id #{id} leeched succesfully."
      end
      id += 1
      puts "id: #{id}"
    end
    puts "Last id: #{id}."
  end
end

if __FILE__ == $PROGRAM_NAME
  RottenTomatoes.leech(0, 100)
end