# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { email: 'user1@example.com', password: 12345678,
                                password_confirmation: 12345678,
                                roles_mask: 6 },
  { email: 'user2@example.com', password: 12345678,
                                password_confirmation: 12345678,
                                roles_mask: 2 },
  { email: 'user3@example.com', password: 12345678,
                                password_confirmation: 12345678,
                                roles_mask: 2 }
  ])
