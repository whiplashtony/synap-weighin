# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('participants.csv', :headers => true, :col_sep => ',') do |row|
  Person.find_or_create_by(:name => row[0])
  Event.find_or_create_by(:name => row[1], :created_at => row[3])
end

CSV.foreach('weighins.csv', :headers => true, :col_sep => ',') do |row|
  Checkin.create( :weight => row[1], :person_id => Person.find_by_name(row[0]).id, :created_at => row[2], :event_id => Event.find_by_created_at(row[2].to_date).id )
end
