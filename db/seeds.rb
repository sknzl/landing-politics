# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Politician.destroy_all
Subordinate.destroy_all
Party.destroy_all
Event.destroy_all

p "Destroy all parties and create 4 parties (red, green, blue, brown)"

parties = ["red","green","blue","brown"]
parties.each do |party|
  Party.create(name: party)
end

p "Destroy all politicians and create 4 politicians per party and 1 superior/leader"

Party.all.each do |party|
  birthyear = (1938..2000).to_a.sample
  party_id = party.id
  leader = 1
  name = Faker::FunnyName.name
  Politician.create(name: name, birthyear: birthyear, leader: leader, party_id: party_id)

  4.times do
    birthyear = (1938..2000).to_a.sample
    party_id = party.id
    leader = 0
    name = Faker::FunnyName.name
    Politician.create(name: name, birthyear: birthyear, leader: leader, party_id: party_id)
  end
end

p "Destroy all subordinates and create 15 per party"

Party.all.each do |party|
  15.times do
    name = Faker::FunnyName.name
    birthyear = (1938..2000).to_a.sample
    party_id = party.id
    Subordinate.create!(name: name, birthyear: birthyear, party_id: party_id)
  end
end

p "Create 20 event of a random politician going to prison between 1970 and 1990 and release at >1990"
politicians = Politician.all.sample(20)
politicians.each do |politician|
  prison_year = (1970..1990).to_a.sample
  free_year = (1991..2018).to_a.sample
  Event.create(year: prison_year, politician_id: politician.id, action: "prison")
  Event.create(year: free_year, politician_id: politician.id, action: "free")
end
