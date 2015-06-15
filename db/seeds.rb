# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1000.times do
	Post.create(title: "Math", description: "numbers 0-9 can hold entire earth")
	Post.create(title: "Chemistry", description: "Organic Chemistry is the best of all Chemistry")
	Post.create(title: "English", description: "I love reading poetries")
end