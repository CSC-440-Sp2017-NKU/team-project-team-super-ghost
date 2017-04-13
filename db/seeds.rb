# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Course.create([
                  {title: 'CSC 440'},
                  {title: 'CSC 362'},
                  {title: 'CSC 364'},
                  {title: 'INF 286'}
              ])

User.create([
                {name: 'Test User 1', email: 'test@email.com', password_digest: '$2a$10$ZzjUgLYojB2njCzirZqTT.i6ekk8De8qnfFxLHatdP3LNNBO22a9i'},
                {name: 'Test User 2', email: 'test2@email.com', password_digest: '$2a$10$ZzjUgLYojB2njCzirZqTT.i6ekk8De8qnfFxLHatdP3LNNBO22a9i'}
            ]) do |u|
  course = Course.find(1)
  u.courses << course
end