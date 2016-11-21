# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('db', 'web_summit_sample.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  fa = FeaturedAttendee.new
  fa.first_name = row['first_name']
  fa.last_name = row['last_name']
  fa.country = row[' country']
  fa.title = row['title']
  fa.company = row['company']
  fa.importance = row['importance']
  fa.bio = row[' bio']
  fa.interests = row[' interests']
  fa.thumbnail_url = row['thumbnail_url']
  fa.image_url = row['image_url']
  fa.save
  puts "#{fa.first_name[0]}. #{fa.last_name}, #{fa.title} @ #{fa.company}"
end

puts "There are now #{FeaturedAttendee.count} rows in the table"
