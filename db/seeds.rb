

# john = Player.create!(name: "John", ..)
# game_paris_sem_48 = Game.create!(..)


GamePlayer.destroy_all
puts 'tous les liens entre les joueurs et les games ont été supprimés'
Comment.destroy_all
puts 'tous les comment ont bien été supprimés'
Game.destroy_all
puts "tous les games ont été supprimés"
Player.destroy_all
puts "tous les joueurs ont été supprimés"


mickael = Player.create!(
    email: 'mick@test.test',
    password: '123456',
    name: 'mickcmik',
    nickname: 'SpeedyMick',
  )

antoine = Player.create!(
    email: 'antoine@test.test',
    password: '123456',
    name: 'anto',
    nickname: 'Speedyanto',
  )

carlos = Player.create!(
    email: 'carlos@test.test',
    password: '123456',
    name: 'Carlitow',
    nickname: 'Speedycar',
  )

  taib = Player.create!(
    email: 'taib@test.test',
    password: '123456',
    name: 'Taib',
    nickname: 'Speedytaid',
  )

  paul = Player.create!(
    email: "player1@gmail.com",
    password: "111111",
    name: "paul",
    nickname: "First1",
  )
  jean_martial = Player.create!(
    email: "player2@gmail.com",
    password: "222222",
    name: "jean-martial",
    nickname: "Second1"
  )
  gustave = Player.create!(
    email: "player3@gmail.com",
    password: "333333",
    name: "Gustave",
    nickname: "Third1",
  )
  geogette = Player.create!(
    email: "player4@gmail.com",
    password: "444444",
    name: "geogette",
    nickname: "Fourth1",
  )

  puts " #{Player.count} joueurs créés !"


  trail_running_alps = Game.create!(
    name: 'Trail Running in the Alps',
    map_polyline: 'encoded_polyline_for_trail_running',
    nb_of_players: 7,
    start_date: Date.today + 2.weeks,
    end_date: Date.today + 1.month,
    status: 'pending',
    latitude: 45.9237,
    longitude: 6.8694
  )

city_marathon = Game.create!(
  name: 'City Marathon',
  map_polyline: 'encoded_polyline_for_city_arathon',
  nb_of_players: 3,
  start_date: Date.today - 1.week,
  end_date: Date.today + 1.week,
  status: 'ongoing',
  latitude: 40.7128,
  longitude: -74.0060
)

running_for_all = Game.create!(
  name: 'running for all ',
  map_polyline: 'encoded_polyline_for_city_arathon',
  nb_of_players: 5,
  start_date: Date.today - 1.week,
  end_date: Date.today + 6.week,
  status: 'pending',
  latitude: 40.7128,
  longitude: -74.0060
)


running_district_paris = Game.create!(
  name: '14eme running',
  map_polyline: 'encoded_polyline_for_city_arathon',
  nb_of_players: 3,
  start_date: Date.today - 1.week,
  end_date: Date.today + 4.week,
  status: 'pending',
  latitude: 40.7128,
  longitude: -74.0060
)

beach_running = Game.create!(
  name: 'Beach Running Finals',
  map_polyline: 'encoded_polyline_for_beach_running',
  nb_of_players: 6,
  start_date: Date.today - 1.month,
  end_date: Date.today - 1.week,
  status: 'finish',
  latitude: 34.0522,
  longitude: -118.2437
)

  running_lyon = Game.create!(
    name: 'Running in lyon',
    map_polyline: nil,
    nb_of_players: 6,
    start_date: Date.today,
    end_date: Date.today + 2.days,
    status: 'ongoing',
    latitude: 51.5074,
    longitude: -0.1278
  )

  paris_run = Game.create!(
    name: 'PARISRUN',
    map_polyline: nil,
    nb_of_players: 5,
    start_date: Date.today + 1.month,
    end_date: Date.today + 1.month + 1.week,
    status: 'pending',
    latitude: 37.7749,
    longitude: -122.4194
  )

  freakruns = Game.create!(
    name: 'running with freaks',
    map_polyline: nil,
    nb_of_players: 6,
    start_date: Date.today + 2.days,
    end_date: Date.today + 3.weeks,
    status: 'ongoing',
    latitude: 51.5074,
    longitude: -26.624
  )
  marathonking = Game.create!(
    name: 'Marathon of kings',
    map_polyline: nil,
    nb_of_players: 4,
    start_date: Date.today + 6.days,
    end_date: Date.today + 2.weeks,
    status: 'ongoing',
    latitude: 41.6374,
    longitude: -17.728
  )

  runlovers = Game.create!(
    name: 'We love running',
    map_polyline: nil,
    nb_of_players: 5,
    start_date: Date.today - 8.days,
    end_date: Date.today + 11.days,
    status: 'ongoing',
    latitude: 37.6345,
    longitude: -5.1436
  )

  runforfun = Game.create!(
    name: 'This is fun for us',
    map_polyline: nil,
    nb_of_players: 3,
    start_date: Date.today - 7.days,
    end_date: Date.today + 1.month,
    status: 'ongoing',
    latitude: 56.4267,
    longitude: -6.6378
  )

  athletevibes = Game.create!(
    name: 'Running is our vibe',
    map_polyline: nil,
    nb_of_players: 8,
    start_date: Date.today - 12.days,
    end_date: Date.today + 2.month,
    status: 'ongoing',
    latitude: 71.1618,
    longitude: -13.0938
  )

puts "Games created!"

GamePlayer.create!(
player: mickael,
game: city_marathon,
ranking: 3
)

GamePlayer.create!(
player: antoine,
game: city_marathon,
ranking: 2
)

GamePlayer.create!(
  player: taib,
  game: city_marathon,
  ranking: 1
  )

GamePlayer.create!(
  game: beach_running,
  player: mickael,
  ranking: 2
)

GamePlayer.create!(
  game: beach_running,
  player: jean_martial,
  ranking: 4
)

GamePlayer.create!(
  game: beach_running,
  player: taib,
  ranking: 6
)

GamePlayer.create!(
  game: beach_running,
  player: antoine,
  ranking: 5
)

GamePlayer.create!(
  game: beach_running,
  player: carlos,
  ranking: 1
)

GamePlayer.create!(
  game: beach_running,
  player: geogette,
  ranking: 3
)

puts "gameplayer created"

Comment.create!(
game: city_marathon, player: mickael, content:"the turtle always win at last !", created_at: "2024-11-25 10:42:00"
)

Comment.create!(
game: city_marathon, player: taib, content:"i'm the one winning for now héhé", created_at: "2024-11-19 18:34:00"
)

Comment.create!(
game: city_marathon, player: mickael, content:"Taiiiib i will catch you up tom im going running and take your place", created_at: "2024-11-22 16:42:00"
)

puts "comment created"
