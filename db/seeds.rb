# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

countries = ['USA', 'UK']

countries.each do |country|
  Country.new(name: country).save
end

professions = ['actor', 'screenwriter', 'director', 'producer']

professions.each do |profession|
  Profession.new(name: profession).save
end