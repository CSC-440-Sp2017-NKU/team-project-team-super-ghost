# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
                {name: 'Professor Joe', email: 'teacher@email.com', password_digest: '$2a$10$ZzjUgLYojB2njCzirZqTT.i6ekk8De8qnfFxLHatdP3LNNBO22a9i', role: 3},
            ])

Course.create([
                  {title: 'CSC 440', user_id: 1},
                  {title: 'CSC 362', user_id: 1},
                  {title: 'CSC 364', user_id: 1},
                  {title: 'INF 286', user_id: 1}
              ])

# Add teacher to courses
teacher = User.find(1)
Course.find_each do |course|
  teacher.courses << course
end

User.create([
                {name: 'John Smith', email: 'student@email.com', password_digest: '$2a$10$ZzjUgLYojB2njCzirZqTT.i6ekk8De8qnfFxLHatdP3LNNBO22a9i', role: 0},
                {name: 'admin', email: 'admin@email.com', password_digest: '$2a$10$ZzjUgLYojB2njCzirZqTT.i6ekk8De8qnfFxLHatdP3LNNBO22a9i', role: 1},
                {name: 'Betsy', email: 'registrar@email.com', password_digest: '$2a$10$ZzjUgLYojB2njCzirZqTT.i6ekk8De8qnfFxLHatdP3LNNBO22a9i', role: 2}
            ]) do |u|
  course = Course.find(1)
  u.courses << course
end