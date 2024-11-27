# Suppression dans le bon ordre pour éviter des conflits de FK
GamePlayerRun.destroy_all
GamePlayer.destroy_all
Run.destroy_all
Comment.destroy_all
Game.destroy_all
Player.destroy_all

puts 'Toutes les données ont été supprimées avec succès.'

# Création des joueurs
carlos = Player.create!(
  email: 'carlos@test.test',
  password: '123456',
  name: 'Carlitow',
  nickname: 'Speedycar'
)
mickael = Player.create!(
  email: 'mick@test.test',
  password: '123456',
  name: 'mickcmik',
  nickname: 'SpeedyMick'
)
antoine = Player.create!(
  email: 'antoine@test.test',
  password: '123456',
  name: 'anto',
  nickname: 'Speedyanto'
)
taib = Player.create!(
  email: 'taib@test.test',
  password: '123456',
  name: 'Taib',
  nickname: 'Speedytaid'
)
paul = Player.create!(
  email: "player1@gmail.com",
  password: "111111",
  name: "paul",
  nickname: "First1"
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
  nickname: "Third1"
)
geogette = Player.create!(
  email: "player4@gmail.com",
  password: "444444",
  name: "geogette",
  nickname: "Fourth1"
)

puts "#{Player.count} joueurs créés !"

# Création des games
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
  map_polyline: 'encoded_polyline_for_city_marathon',
  nb_of_players: 3,
  start_date: Date.today + 2.weeks,
  end_date: Date.today + 1.month,
  status: 'ongoing',
  latitude: 40.7128,
  longitude: -74.0060
)

beach_running = Game.create!(
  name: 'Beach Running Finals',
  map_polyline: 'encoded_polyline_for_beach_running',
  nb_of_players: 6,
  start_date: Date.today + 2.weeks,
  end_date: Date.today + 1.month,
  status: 'finish',
  latitude: 34.0522,
  longitude: -118.2437
)

puts "#{Game.count} jeux créés !"

# Création des GamePlayers
gp1 = GamePlayer.create!(game: trail_running_alps, player: carlos, ranking: 1)
gp2 = GamePlayer.create!(game: trail_running_alps, player: mickael, ranking: 2)
gp3 = GamePlayer.create!(game: city_marathon, player: antoine, ranking: 2)
gp4 = GamePlayer.create!(game: city_marathon, player: taib, ranking: 1)
gp5 = GamePlayer.create!(game: beach_running, player: mickael, ranking: 2)
gp6 = GamePlayer.create!(game: beach_running, player: jean_martial, ranking: 4)

puts "GamePlayers créés !"

# Création des commentaires
Comment.create!(
  game: city_marathon,
  player: mickael,
  content: "The turtle always wins at last!",
  created_at: "2024-11-25 10:42:00"
)

Comment.create!(
  game: city_marathon,
  player: taib,
  content: "I'm the one winning for now héhé",
  created_at: "2024-11-19 18:34:00"
)

puts "Commentaires créés !"

# Création des runs
run_1 = Run.create!(
  start_datetime: "2024-11-25 18:40:23",
  end_datetime: "2024-11-25 19:38:27",
  start_lat: 48.848487,
  end_lat: 48.848325,
  start_long: 2.272994,
  end_long: 2.273316,
  polyline: "wadiH_j{LwD}DMy...",
  strava_activity_id: 12982250051,
  player: carlos
)

run_2 = Run.create!(
  start_datetime: "2024-11-24 10:40:21",
  end_datetime: "2024-11-24 12:08:36",
  start_lat: 48.848528,
  end_lat: 48.84846,
  start_long: 2.272135,
  end_long: 2.27282,
  polyline: "imciH_g{L`@uAf@...",
  strava_activity_id: 12975941321,
  player: mickael
)

puts "Runs créés !"

# Création des GamePlayerRuns
GamePlayerRun.create!(game_player: gp1, run: run_1)
GamePlayerRun.create!(game_player: gp2, run: run_2)

puts "GamePlayerRuns créés !"
