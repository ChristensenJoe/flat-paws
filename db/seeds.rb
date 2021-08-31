puts "Seeding Starting...."

puts "Destroying old data..."

Shelter.destroy_all
Pet.destroy_all

puts "Seeding shelters..."

Shelter.create(location: "New York", name: "Care Pets", capacity: 1)


puts "Seeding pets..."

Pet.create(name: "Spot", breed: "Yorkie", age: 2, weight: 20, gps_chip: true, shelter_id: 1)
Pet.create(name: "Pudding", breed: "Border Collie", age: 4, weight: 60, gps_chip: true, shelter_id: 1)

puts "Finished Seeding..."