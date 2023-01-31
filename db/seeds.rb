# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.destroy_all
Member.destroy_all

smash = Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)
double = Team.create!(name: "Double Dragon", games_won: 9, won_championship: false)
bowery = Team.create!(name: "Bowery Boys", games_won: 20, won_championship: false)
green = Team.create!(name: "Green Street Hooligans", games_won: 0, won_championship: false)

mario = Member.create!(name: "Mario", wage: 95.05, injured: false, team_id: smash.id)
luigi = Member.create!(name: "Luigi", wage: 90.00, injured: true, team_id: smash.id)
bowser = Member.create!(name: "Bowser", wage: 190.00, injured: false, team_id: smash.id)
billy = Member.create!(name: "Billy", wage: 12.50, injured: false, team_id: double.id)
jimmy = Member.create!(name: "Jimmy", wage: 12.50, injured: false, team_id: double.id)
william = Member.create!(name: "William 'Butcher' Poole", wage: 1.25, injured: false, team_id: bowery.id)
tom = Member.create!(name: "Tom McCann", wage: 13.25, injured: true, team_id: bowery.id)
pete = Member.create!(name: "Pete Dunham", wage: 19.25, injured: false, team_id: green.id)
matt = Member.create!(name: "Matt Buckner", wage: 5.15, injured: true, team_id: green.id)
