user = User.new(
  fullname: 'Kazel',
  email: ENV['MY_SEED_EMAIL'],
  password: 'kazelkazel'
)
user.skip_confirmation!
user.save!

user2 = User.new(
  fullname: 'Chandler',
  email: 'chanchan@gmail.com',
  password: 'chanchan'
)
user2.skip_confirmation!
user2.save!

room1 = user.rooms.create!(
                    home_type: 'Apartment',
                    room_type: 'Private',
                    accommodate: 3,
                    bed_room: 1,
                    bath_room: 2,
                    listing_name: 'Beautiful place in Melbourne',
                    summary: 'This is a nice house.',
                    address: '99 Burwood Hwy, Burwood East',
                    price: 150,
                    active: true
)

room2 = user.rooms.create!(
                    home_type: 'House',
                    room_type: 'Private',
                    accommodate: 1,
                    bed_room: 1,
                    bath_room: 3,
                    listing_name: 'Beautiful place for your dream',
                    summary: 'Spend a unforgettable holiday in the enchanting surroundings of the town of Cisternino',
                    address: '1 Pear Ct, Burwood East, VIC, 3151',
                    price: 200,
                    active: true
)

room3 = user.rooms.create!(
                    home_type: 'House',
                    room_type: 'Private',
                    accommodate: 2,
                    bed_room: 1,
                    bath_room: 3,
                    listing_name: 'Your Dream House',
                    summary: 'Suite of three beautifully furnished rooms set amongst the trees. Just minutes from downtown, this secluded property is an urban retreat like no other. The treehouse provides and intimate, simple and calming retreat for 2 people. The tree house is the subject of innumerable articles, blogs and was recently featured on Treeouse Masters Ultimate Treehouses. The treehouse',
                    address: '112 Warrigal Road, Camberwell, Victoria, Australia',
                    price: 300,
                    active: true
)

start_end_ary = [
  {
    start_date: Date.today << 1,
    end_date: (Date.today << 1) + 3
  },
  {
    start_date: Date.today,
    end_date: Date.today + 3
  },
  {
    start_date: Date.today >> 1,
    end_date: (Date.today >> 1) + 3
  }
]

3.times do |num|
  room_id = num +1
  room = Room.find(room_id)

  3.times do |n|
    start_date = start_end_ary[n][:start_date]
    end_date = start_end_ary[n][:end_date]
    days = (start_date - end_date).to_i + 1

    user2.reservations.create!(
      room_id: room_id,
      start_date: start_date,
      end_date: end_date,
      price: room.price,
      total: room.price * days,
      status: 1
    )
  end
end