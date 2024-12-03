# Suppression dans le bon ordre pour éviter des conflits de FK

GamePlayerRun.destroy_all
GamePlayer.destroy_all
Run.destroy_all
Comment.destroy_all
Game.destroy_all
Player.destroy_all

puts 'Toutes les données ont été supprimées avec succès.'

require "open-uri"

# file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open
# article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# article.save

# Création des joueurs
carlos = Player.create!(
  email: 'carlos@test.test',
  password: '123456',
  name: 'Carlitow',
  nickname: 'Speedycar'
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# carlos.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# carlos.save!

mickael = Player.create!(
  email: 'mick@test.test',
  password: '123456',
  name: 'mickcmik',
  nickname: 'SpeedyMick'
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# mickael.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# mickael.save!

antoine = Player.create!(
  email: 'antoine@test.test',
  password: '123456',
  name: 'anto',
  nickname: 'Speedyanto'
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# antoine.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# antoine.save!

taib = Player.create!(
  email: 'taib@test.test',
  password: '123456',
  name: 'Taib',
  nickname: 'Speedytaid'
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# taib.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# taib.save!

paul = Player.create!(
  email: "player1@gmail.com",
  password: "111111",
  name: "paul",
  nickname: "First1"
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# paul.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# paul.save!

jean_martial = Player.create!(
  email: "player2@gmail.com",
  password: "222222",
  name: "jean-martial",
  nickname: "Second1"
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# jean_martial.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# jean_martial.save!

gustave = Player.create!(
  email: "player3@gmail.com",
  password: "333333",
  name: "Gustave",
  nickname: "Third1"
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# gustave.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# gustave.save!

geogette = Player.create!(
  email: "player4@gmail.com",
  password: "444444",
  name: "geogette",
  nickname: "Fourth1"
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# geogette.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# geogette.save!

puts "#{Player.count} joueurs créés !"

# Player.all.each do |player|
#   file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
#   player.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
#   player.save!
# end

# Création des games
trail_running_alps = Game.create!(
  name: 'Trail Running in the Alps',
  map_polyline: "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
  nb_of_players: 4,
  start_date: "2024-11-26",
  end_date: "2024-12-10",
  status: 'ongoing',
  latitude: 45.9237,
  longitude: 6.8694
)

city_marathon = Game.create!(
  name: 'City Marathon',
  map_polyline: "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
  nb_of_players: 4,
  start_date: Date.today + 2.days,
  end_date: Date.today + 1.month,
  status: 'ongoing',
  latitude: 40.7128,
  longitude: -74.0060
)

beach_running = Game.create!(
  name: 'Beach Running Finals',
  map_polyline: "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
  nb_of_players: 6,
  start_date: Date.today + 2.weeks,
  end_date: Date.today + 1.month,
  status: 'finish',
  latitude: 34.0522,
  longitude: -118.2437
)

panam_running = Game.create!(
  name: 'Panam Running',
  map_polyline: "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
  nb_of_players: 5,
  start_date: Date.today - 1.week,
  end_date: Date.today + 3.month,
  duration: 50,
  status: 'pending',
  latitude: 34.0522,
  longitude: -118.2437
)

antourun = Game.create!(
  name: 'antou run',
  map_polyline: "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
  nb_of_players: 2,
  start_date: Date.today - 1.week,
  end_date: Date.today ,
  duration: 7,
  status: 'finish',
  latitude: 34.0522,
  longitude: -118.2437
)
puts "#{Game.count} jeux créés !"

# Création des GamePlayers
gp1 = GamePlayer.create!(game: trail_running_alps, player: carlos, ranking: 1)
gp2 = GamePlayer.create!(game: trail_running_alps, player: mickael, ranking: 2)
gp3 = GamePlayer.create!(game: trail_running_alps, player: jean_martial, ranking: 3)
gp4 = GamePlayer.create!(game: trail_running_alps, player: antoine, ranking: 4)


puts "#{Game.count} jeux créés !"

# Jeu a 4 joueurs sur 5 à join pendant la demo
gp1 = GamePlayer.create!(game: panam_running , player: antoine, ranking: 1)
gp2 = GamePlayer.create!(game: panam_running , player: mickael, ranking: 2)
gp3 = GamePlayer.create!(game: panam_running , player: jean_martial, ranking: 3)
gp4 = GamePlayer.create!(game: panam_running , player: paul, ranking: 4)


# Autres jeux
gp5 = GamePlayer.create!(game: city_marathon, player: antoine, ranking: 1)
gp6 = GamePlayer.create!(game: city_marathon, player: mickael, ranking: 2)
gp7 = GamePlayer.create!(game: city_marathon, player: jean_martial, ranking: 3)
gp8 = GamePlayer.create!(game: city_marathon, player: paul, ranking: 4)

gp8 = GamePlayer.create!(game: beach_running , player: taib, ranking: 1)

gp9 = GamePlayer.create!(game: antourun , player: antoine, ranking: 1)
gp9 = GamePlayer.create!(game: antourun , player: carlos, ranking: 1)




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


puts "Runs créés !"




### Id run exclu : 12807121651
# Id run inclus : 12316578164


run_seven = Run.create!(
  name: 'run seven',
  start_datetime: "2024-12-09 12:00:00",
  end_datetime: "2024-12-09 13:00:00",
  start_lat: 48.87619586661458,
  end_lat: 48.876970605924726,
  start_long: 2.332328511402011,
  end_long: 2.333370130509138,
  polyline:   "e}hiHsofMn@{@bAOp@g@bA?p@QRAh@SzAiAPJ@ZLB`@Ab@Rd@JJh@JVdA[h@Nf@X\\V`@HNALJ`@RJJ`@JTLFO^Yb@QD@P`@Zf@`@`AZHHJTZz@fBh@l@tApB^L^Yh@t@h@Vr@Pj@H~@xAXp@T^lA~@\\f@X|@NXf@Nj@|@d@`@PGN?@DKIH{@HeB^kBbBcHFQJMpAuGXw@f@T`@HZb@f@h@T?`@RtA`@l@h@n@z@\\\\r@`@`@\\n@TJKNGVoATi@DAR[RmAj@uFZeCPcBf@mCj@eEF[N_@J_@ZoBJcALuDp@kHJuBDSAe@Fy@VoAX{Ct@sGRqAlBaJZiBJsARqA\\{A`@y@j@iEXaBVo@zCcMN[`@oBRi@TcBP]RgAh@aBf@yBh@iBX[B?JHdArA~@^TLJAHW\\iBn@kCHs@`@eB^{BJWb@{@JwAx@cDJg@n@yBt@_Bl@c@j@Of@FZV[~AOj@Kt@Mj@Up@If@]hAO^]vAQb@Ip@a@jBW\\Op@Iv@g@`BWp@Af@[z@Ub@Mn@AJQn@KJENCVBt@Hb@Dd@RfAFj@AFIDc@NaBXaAX_@Rk@l@iA~@y@nAQh@Yh@UJ{B{AQGSl@_Av@Wt@QdA{@`DAPm@~CIx@K^ILUB[Im@m@a@Yg@O_@[k@[kACmBg@_@FMCKKIWUYe@MUAIMy@o@OCg@WYSk@[e@DKEU_@[M]YMUKCGDKBUK][m@Ie@WYa@g@Ug@e@I?_@TK?OQc@Wu@{@ECc@F_@Kc@[g@m@c@YOCi@@g@_@q@s@cAu@i@Jo@m@k@c@c@Ia@Ba@SYY[Kk@i@mAOsByAQ?IK[E_@Sy@JONUp@YpDSrAm@zCSp@Iv@Ml@OjASt@QlAEf@Cn@QbAE`AQdAG`AKl@u@GW@]GmBHg@Co@@e@IW@QES?s@DcBWi@@EHG?gAU}@I_@?oAK}@Ug@Cs@|Ag@t@i@~AUXQj@QNCN?ZNr@Ht@Mv@S|DBZFNCb@BrAItACbBBvAUhEP~@EnB@PAh@I|A@ZAR]~AF\\@ZItA?`AJtBHv@DHAh@Kz@BXIN",
  strava_activity_id: 123165781647,
  player: mickael
)

run_eleven = Run.create!(
  name: 'run eleven',
  start_datetime: "2024-12-09 13:00:00",
  end_datetime: "2024-12-09 14:00:00",
  start_lat: 48.87619586661458,
  end_lat: 48.876970605924726,
  start_long: 2.332328511402011,
  end_long: 2.333370130509138,
  polyline:   "kxmMoahiHg^?oKnPcGzTnA~W~WnKjWjHvQcBvQgE?kHoKoKoKoKgEoKgE_]",
  strava_activity_id: 1231657816411,
  player: jean_martial
)

run_five = Run.create!(
  name: 'run five',
  start_datetime: "2024-12-09 14:00:00",
  end_datetime: "2024-12-09 15:00:00",
  start_lat: 48.849919,
  end_lat: 48.849919,
  start_long: 2.341165,
  end_long: 2.341165,
  polyline:   "__diHighMfv@sTqD}xAa^aHyg@f{@nHvm@tKrL",
  strava_activity_id: 123165781645,
  player: antoine
)

essai_sud = Run.create!(
  name: 'esssai sud',
  start_datetime: "2024-12-09 16:00:00",
  end_datetime: "2024-12-09 17:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "sijMee`iHp@ya@j`@}BpmAqQdoA?by@mg@mNfSr^vEwLl^{b@|^_s@eNgZ~UsaA`CogAoC",
  strava_activity_id: 12316578164912,
  player: carlos
)


## RUNS TESTS INTERSECTIONS


inside_loop = Run.create!(
  name: 'inside loop',
  start_datetime: "2024-12-09 17:00:00",
  end_datetime: "2024-12-09 18:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "cxciHif{LHWFm@C_@BSLSNGHO?MDE@KFOESGMa@]c@We@a@OEMKAIOUM]IIIAGSEAISg@[KMCIIGIOMEWQEKSGQk@OS_@gAm@LOI]i@SEWHONETKTCPM`@QLU^MHADMLMHQNAJGBKL[`AOV[tACTMVKd@FRPTHV\\h@ZlALP",
  strava_activity_id: 123165781649128,
  player: antoine
)

outside_loop = Run.create!(
  name: 'outside loop',
  start_datetime: "2024-12-01 19:00:00",
  end_datetime: "2024-12-01 20:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "mmciHmg{LJUBQ^gAV}@Pa@r@cCLm@LUBSHOBOIQMKI[BOLYLg@@SAWB[DUCs@M{@Di@Cg@@YIq@Ae@KaA@KCeCF]C]G[@IAOQoA?e@Ec@J_BAU@_@IY?g@JqCES?]KYM{@Ek@B_@?g@Ky@Da@E]?_@Lc@AKCG?SCQG[?e@Eg@@SGO?q@E]B_@FU?K?IKUCmAB[Ia@?]Hk@?K_@mCAq@@WEg@BKC_@EUQ_@Gg@IUM{AFuADQDa@DkBDQAOFqAAa@KmA@YE]Ae@Ia@@YK_@I_ALw@Cc@I]EIOGKK[e@K[MWE[EIe@Oc@q@YYMYWWg@w@GGe@Wk@fAK`@KRKZEXg@fAEXSd@Ib@IfA]vAGh@GPKJMv@IJMd@Wd@Ih@Yh@i@nAI^GDIv@QTENGFQ^SJOPQDOZETKFOVYPoA|AMHG?CFGAg@f@QDIPOFEF?LEPMHILQFILWRIDG?MFW\\E@SRY\\IFQRW^k@h@QHW^KDM?KBG^CCCBEN@b@GXYXKBMNKBaB~AMRq@r@UPe@f@MFc@f@OTCNQTQXH`@@XBHn@f@Xt@PFPPF@NXH\\TXJPHFNNHPb@l@P`@TVPLLb@d@h@RFRZN`BEd@Dp@A`@BHB^?^B`@A`@Ed@BH?PDF?PEf@A`AH~@Cf@OjADp@E^BN?Z?JTv@BRBD?LLt@HLBRWh@GDCHIJGPYHITUd@Gb@MRMDIXYd@CHEFSLYv@ETGJ[FMHS@MVc@f@Ij@Af@I^Ad@U|@Q`@GV_@p@k@t@QJCFOPG@CFCH?h@K\\SP?JLTNNLXZj@Zt@FZZp@l@x@FR\\h@Lb@JLRj@HPNLJVFXJR^ZJBPLHJPLPTLFTZRHf@x@DDTHn@bANLH@f@?VFRXLHRBFBNBXLTZj@j@\\RHEH@RKd@e@TKNANGV[Zo@ZMV_@",
  strava_activity_id: 123165781649126,
  player: antoine
)

intersect_loop = Run.create!(
  name: 'intersect-loop',
  start_datetime: "2024-12-09 20:00:00",
  end_datetime: "2024-12-09 21:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "uodiH}rzLEFIFM@QNQDUJOEMIWGKFIRQLKFYBIFIP[VE@W^UJa@n@SFEHEVGHE?GDGNGZGNSPC\\Md@Mz@CBAj@K~@W|@CTCpACF@LE\\Kb@EH?J_@l@CTDj@ITC@IV?VGR?TOz@EJIXCp@EZ?NBHLLFL\\ZP`@~@dAD@PPJDJH^`@VHVNLCJFRBRVb@LHLZFZVvAp@DDBPXFLLNBLAR@RGDGDM?sA@QFS\\_@JY@KPWTo@HIRa@LKDOnAgBFUPMNCFCRCF@VQBGLIBIROJS^WJKLEH?PFf@DP?DBT?L@HAHBHLF@BATY`@W^k@P?DG@]FSDEBSDG|@D\\QL[Ds@Fc@?U[gAIo@@WKk@I[A_@No@?a@Nw@Lc@N{@BIHGPs@A[Ns@HcAGe@@_@La@Bm@FW?IHw@FWH_AL_@JQFOIk@?m@Qi@Qw@_@]SIIMM[UYOo@c@u@UOGF",
  strava_activity_id: 123165781649129,
  player: paul
)


# run_nine = Run.create!(
#   start_datetime: "2024-11-28 12:00:00",
#   end_datetime: "2024-11-28 13:00:00",
#   start_lat: 48.8795,
#   end_lat: 48.8795,
#   start_long: 2.3375,
#   end_long: 2.3375,
#   polyline:   "{wiiHkpgMv`@wmAzOjk@nZfpAc`@~Wc[ce@{Ow`@",
#   strava_activity_id: 123165781649,
#   player: mickael
# )

run_blois = Run.create!(
  start_datetime: "2024-11-28 12:00:00",
  end_datetime: "2024-11-28 13:00:00",
  start_lat: 47.5855,
  end_lat: 47.5855,
  start_long: 1.3346,
  end_long: 1.3346,
  polyline:   "gtcGk`maH{JgEwQsIsNgJsNkHsNkHsNkHsNgEkHcBkHgEn~BzfA",
  strava_activity_id: 1231657816491,
  player: taib
)

## NEW RUNS

test_greg = Run.create!(
  name: 'test-greg',
  start_datetime: "2024-12-09 20:00:00",
  end_datetime: "2024-12-09 21:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "k_iiHsbiMvCZTCzAXfACv@NlA\\VPd@Bn@GXLf@Er@\\TBPd@Dp@?n@Ad@QlASj@RR^PlARRPj@NL?XUN@ZNLXl@JNX^@b@Jl@b@f@CLLBJPAFJb@ZP@`@RLAVPPOVAXXfA`@l@JPJf@@j@Z|Cz@\\ZBnBZ|AGp@WpADj@D?T[VEj@^`@\\`@d@tARh@KZFh@Xn@Jb@XVK|@l@jB`A`@f@VDR`@@j@FPIbAh@h@FPLDBTYr@G^e@~@Gd@JXRJ~@J|BhA~@VjBrBf@\\p@TJRj@EXYVcANsAb@iCNs@?Qd@iBHaALaCDgAAy@RmAT}@L}CJkA?cAH{@Po@@o@ZkBVeCAg@DWLSXkBPi@?SjAcFDq@Nm@@[Jg@H}@l@sCRkAFw@`AuEN_ANsA\\oAn@{AHi@JOr@}DRg@PIb@eATu@RcAHw@d@uBRYLo@\\w@\\k@F[h@qAb@uA^uAb@cC`AgDBa@Vu@PoAn@wAl@mB^sBVi@tAkFL_@Zc@z@Y|BOXPVDTUnA?zAc@`BkBTO|BmA~Bw@NOIsAF[DEHF@MWuDHCZYHUPQRm@W]F]CYEG?MT]`ABNWeALsAuASEYYQAQU[Cm@[WCQOe@IoAq@GM[Qq@Ak@[]?_@]e@Og@A]Wm@MUOQ?USs@YoBm@k@]S]g@]i@w@iAm@e@aAM@{@w@e@GCG_@Me@i@iAm@iBQOWk@KKK_AUe@a@QCe@_@_@CSOe@S]Ay@OMOq@Sa@_@i@O[Ba@Mk@[SEMMY?WS_AUMOaASc@Q]Ye@Oq@@}@YcAC[JgAGq@Lg@^q@Vi@d@_AZ}@t@a@Li@VMXO@c@^q@Z]Ri@f@c@Z_@NSVm@Ry@l@SBk@j@i@Vw@bA}Ar@gBvA_@Fc@b@_B~@w@t@i@ZSVk@ZKNa@LYTQBs@p@iAz@c@PGNYCi@f@UZaAr@OYEAM`@{@l@q@n@WEuA|Aw@PIN{@j@S\\GBEPe@d@m@eAm@w@AO]SEWQQO]?[U]GWWM_@e@So@_AkBUWGYMKYm@a@k@Qi@W[Wi@SMMSIWGEAU[WEiA@cAD{@?}@Mw@RUEm@@gA",
  strava_activity_id: 123165781649129,
  player: carlos
)


sud_paris= Run.create!(
  name: 'sud paris',
  start_datetime: "2024-12-09 20:40:00",
  end_datetime: "2024-12-09 21:03:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "e}diHqnhM}DfH}AdCe@^qFrLaAzGEbDUdCgBtJMxBqCtNkAbEoAtG}AnGmFxXc@~CwArFuBvKUnJErI\\fAA`CT~CApBb@pFh@|v@QnCF`EzAzM~CxJ`BdC^nBhBvEZZnALXv@|Ap@\\dBz@nB|GzItKfEt@DT`Ax@JjB~B~@pBnHtI~BbFzAhCpDrCxA`ED|@d@hAxB`CnG~IPp@bFdJJn@lBdBtJfIdAVrF~Ep@`AFgASmAlBaGhMsGhBh@zAhBfBrAXbArAlAtBmKLqHNw@PMp@aBDsB`@qAb@mDl@mBl@yD|@sBPaDvBgIDs@jA{Dz@gCz@yAh@mC^q@n@gCpCsGxAwFzA}Ch@aCFqA|@mC~@kHd@y@NuCTSDoAZu@PmFn@sAHcCbAsDKm@j@{@t@gCJqAQyAn@sDFiBb@k@I_DHg@r@_AX{BXy@ZIN]W}D`@qEt@yFb@m@Tw@TqBCy@bAuDL_BAaBd@iDj@gBHo@Gg@n@}C`@iCDcBb@}Bl@cBv@wEVeF\\eBn@gBMs@bAgGFsBx@aBf@oBn@aE\\yDIsBRkBGmAHcA|@gGNm@J?P_A`@}CHcCv@_EBaAj@}CXi@JqA\\cAhAwGr@uH~@{EdAcJT_DIaFz@kGAcEaAcG@o@_@yAc@{CKcBeBgGm@iDMy@CeDHeGIcGPmDx@gCbAcA|@sBjCqDXoBAyCP_A]}Ok@cDeByE_AgIgDmNe@u@g@kC?q@a@_A{@uEo@eBm@yCq@{AsAwHg@}@iBcG]wC_@mAKeASa@a@gD[}@sEsU_DsHoAgF]e@yD}L{B{FfAnCI\\JnArCfHn@hAx@Ag@gAiA~BiBrByErEcBhCg@^eBxCcDrDk@hAyBbCg@`A}@d@kAfByB~EoEnFuE~Gq@PcCvAi@l@_B|@Mx@k@|@o@GwExGqBxCQ?y@x@Sf@q@f@Yd@a@|AwAjAm@z@uAz@k@hAIh@C~BiA|BkBbBcAdBqBtBMdBs@vBuBtAcA|@}DdG_FxI_FlGyChGaAfA[|AAl@c@FoAbIoBvHyDnQ[xBeA`DsJpLk@q@sAs@eDm@qHcDiAjGeA`Ew@hGwBnKi@jBo@tDqAhN}@tPcCxOGPuBDeAh@yBYg@xACz@F^KlBmAtDsA|FqAf@sEoBw@n@gDrN{@e@sGwF_BsCs@c@cAkA{Ay@wHsH]o@aAh@iAQeBoA}BA",
  strava_activity_id: 123165781649129,
  player: antoine
)

boucle_buttes= Run.create!(
  name: 'boucle buttes',
  start_datetime: "2024-12-09 20:07:00",
  end_datetime: "2024-12-09 21:30:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "ofiiHeffM]RWCYLS\\[XQ@AP]Dg@XSZm@PWTIZqAh@KH@Di@^gAXc@VMAKOwA|@{@HYRcCd@e@d@{Bp@iCYw@_@cAUoCuAmCiCGa@P_@iCiB{@aASa@SqAsAwCm@{@Sk@Gm@f@eCRe@TsAVs@dAaEn@sCo@YCOQQOo@DM\\SJa@?{@NeA?[Ie@[Em@w@]}@Gk@Sa@EYu@k@a@KYg@QOEc@H_BJa@^w@NwAG]WQy@SMY?g@Le@@uB[gBHeA@}@[eASmAHQx@Dz@`@jAVvAt@Zb@DtCXpBRJfAWPF@GZQb@Bz@YLBSt@Hr@CH^vAr@^rAi@rCQ~@}BGs@KYAgBOuAYy@?_@UaBm@eBOw@YaCEwAI{@Ok@CaBSeBCaBKmABg@CyAa@oD@m@FMEaAOkBc@yBDq@?kBMe@H_A@wAEu@@q@EyAOiBDq@?kAUkAC_@a@mMFIp@KHi@AyAFk@E}B]_DDaA@_BPuCSmDXsCVgFE_@R_F@sEHo@V[Xi@^_@x@g@b@g@`@m@Rk@HIH]UaCYc@Dc@HGAO_@}@^yCAg@]aBOUC{@d@qCD{@JYBg@NaAFgA?m@G{@a@gAHg@ZwFJy@C{@BaAXmBS}FLs@N}DXg@z@MRcAu@{C}@iCE[A_@MkA@}AE_AFy@l@kAl@aB\\i@pF{D|AiDb@k@`@KRDFLBl@Q|@I~BHzCAp@Dj@j@`BTrAPf@ZfBRn@CbGLdARj@NHZh@fArA~ClBtBd@xAp@Rv@?|@Qt@s@tA]^oA~@kAV{@AMJwBXQx@W^QFg@nAe@p@aCxESr@Br@IXg@|@uAhEL^LTUl@i@~@QdAoA~CqCxEg@|AGb@ZZPf@Bz@Ez@@t@RnBz@zE^vCl@tDj@|ALt@Bl@`@tBDp@VzAP~@Th@JlAVlAVt@Ln@R`CfAvHLRFv@n@nCb@|BXn@F\\TjBL^Lr@HdAZ|ATn@Fz@\\jANt@?b@_@lAC`@HPb@RBHv@~Ef@~DdBdJf@pB`@vBLlAd@zBJv@DxAXjB^f@jA|G^dD\\vAJ~@HjAMjC@d@Q|B@nAGbBO^[LYb@}@b@o@xA_@TOtCAfAF|CL^V@Q~A",
  strava_activity_id: 123165781649129,
  player: antoine
)

petit_boucle_domicile= Run.create!(
  name: 'petit boucle à domicile',
  start_datetime: "2024-12-09 20:10:00",
  end_datetime: "2024-12-09 21:02:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "yxciHkj{LWg@EC]COGu@uAG?YQYCMOCSQWAGs@k@S][UIQOSEUSYo@mDCGGAEGOOS{@C@AGMg@?OBQRYXYd@[j@m@Vm@x@qABKCOi@s@}@eAkCcE[_@gA}A[q@G_@Q_@k@q@}@qAKUSSKO[[_@y@o@aASm@iEyGc@i@O]]c@u@uA?K\\_@DMDSDg@HYTi@~@qA@MCKII]I]OE@EXG@e@WoB_AeA]cBo@w@m@i@[SSaAsASg@[c@O_@k@s@Yq@}@}AUW_@k@MYCMUy@O[w@w@e@_@Yg@k@o@eCkEQQ_@m@Ua@}AwDS]G[s@yBGGC@y@~@eBjAe@f@SFK`@?LL^Jf@`@rAj@rCjA~Cl@hAVTXd@RPz@pA\\^|@tArBfCb@`AZb@bBtBv@x@^f@Zd@tBnC`@t@\\Zd@n@RRbAzAXRNBDBVf@n@n@R`@b@f@Zt@d@b@z@rAFN|BzC`@r@h@v@`@t@HHtArBvAnBnArBP^Nl@RZb@hAX\\\\t@Vr@^|Aj@fAHJt@vAZf@Lf@\\r@FRd@n@DVZXVNNN^p@FNJr@^hA\\Xj@t@FTLRf@`@",
  strava_activity_id: 123165781649129,
  player: mickael
)



# # CRun pour panam running
# GamePlayerRun.create!(game_player: gp1, run: run_five)
# GamePlayerRun.create!(game_player: gp2, run: run_nine)
# GamePlayerRun.create!(game_player: gp2, run: run_seven)
# GamePlayerRun.create!(game_player: gp3, run: run_eleven)

# # Runs pour trail running in the alps
# GamePlayerRun.create!(game_player: gp9, run: run_five)
# GamePlayerRun.create!(game_player: gp9, run: run_nine)
# GamePlayerRun.create!(game_player: gp10, run: run_seven)
# GamePlayerRun.create!(game_player: gp11, run: run_eleven)


puts "GamePlayerRuns créés !"


Notification.create!(title: "New Game Added", content: "A new game has been added to your favorites.Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Aliquam consectetur venenatis blandit. Praesent vehicula, libero non pretium vulputate,
  lacus arcu facilisis lectus, sed feugiat tellus nulla eu dolor.
  Nulla porta bibendum lectus quis euismod. Aliquam volutpat ultricies porttitor.
  Cras risus nisi, accumsan vel cursus ut, sollicitudin vitae dolor. Fusce scelerisque eleifend lectus in bibendum.
  Suspendisse lacinia egestas felis a volutpat.", created_at: 2.hours.ago, player: taib)

Notification.create!(title: "Add me to your game buddy", content: "Man, it would be great to add me to your game, it'll be challenging", created_at: 1.hour.ago, player: taib)
Notification.create!(title: "Let's do some cardio", content: "Man, it promise it would be great to add me to your game, i swear to god", created_at: 1.hour.ago, player: taib)


Notification.create!(title: "Game Reminder", content: "Don't forget your upcoming game tomorrow.", created_at: 1.day.ago, player: carlos)
Notification.create!(title: "Achievement Unlocked", content: "You unlocked the 'Marathon Master' badge!", created_at: 3.days.ago, player: antoine)



seven_coords = [
  [48.861093, 2.297047],
 [48.856918, 2.314303],
 [48.849105, 2.316581],
 [48.845493, 2.310304],
 [48.844626, 2.296665],
 [48.847402, 2.287592],
 [48.857352, 2.289194],
 [48.861093, 2.297047]
]
# "ydfiHqs_M`YyjBxo@gMrUff@jDdtAiPvw@e}@_IkVcp@"


eleven_coords = [
  [48.863731, 2.370202],
  [48.865396, 2.380478],
  [48.861637, 2.388082],
  [48.856508, 2.386295],
  [48.853111, 2.379265],
  [48.852016, 2.367259],
  [48.854948, 2.360066],
  [48.859620, 2.357709],
  [48.864248, 2.363169],
  [48.863731, 2.370202]
]
# "iufiHw|mMmIg_AnVon@`_@bJfT|j@xE`jAiQ|k@e\\vM}[ca@fB}j@"
