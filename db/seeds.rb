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
  email: 'carlo@runation.fr',
  password: '123456',
  name: 'Carlo',
  nickname: 'Darkarl41'
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# carlos.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# carlos.save!

mickael = Player.create!(
  email: 'mick@test.test',
  password: '123456',
  name: 'Mickael',
  nickname: 'Micka'
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# mickael.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# mickael.save!

antoine = Player.create!(
  email: 'antoine@test.test',
  password: '123456',
  name: 'Antoine',
  nickname: 'Anto'
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# antoine.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# antoine.save!

taib = Player.create!(
  email: 'taib@test.test',
  password: '123456',
  name: 'Taib',
  nickname: 'Taib'
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# taib.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# taib.save!

paul = Player.create!(
  email: "paul@test.test",
  password: "111111",
  name: "Paul",
  nickname: "Polo"
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# paul.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# paul.save!

xavier = Player.create!(
  email: "xavier@test.test",
  password: "222222",
  name: "Xavier",
  nickname: "Xav75"
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# xavier.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# xavier.save!

gustave = Player.create!(
  email: "gustave@gmail.com",
  password: "333333",
  name: "Gustave",
  nickname: "Gus77"
)

# file = URI.parse("https://images.unsplash.com/photo-1732919258508-3fd53a8007b6?q=80&w=2646&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
# gustave.photo.attach(io: file, filename: "avatar_player.png", content_type: "image/png")
# gustave.save!

camille = Player.create!(
  email: "camille@gmail.com",
  password: "444444",
  name: "Camille",
  nickname: "Cam"
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
le_wagon_run = Game.create!(
  name: 'Le Wagon Run batch #1811',
  map_polyline: "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
  nb_of_players: 5,
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
  end_date: Date.today,
  duration: 7,
  status: 'finish',
  latitude: 34.0522,
  longitude: -118.2437
)
puts "#{Game.count} jeux créés !"

# Création des GamePlayers
gp1 = GamePlayer.create!(game: le_wagon_run, player: carlos, ranking: 1)
gp2 = GamePlayer.create!(game: le_wagon_run, player: mickael, ranking: 2)
gp3 = GamePlayer.create!(game: le_wagon_run, player: xavier, ranking: 3)
gp4 = GamePlayer.create!(game: le_wagon_run, player: antoine, ranking: 4)


puts "#{Game.count} jeux créés !"

# Jeu a 4 joueurs sur 5 à join pendant la demo
gp1 = GamePlayer.create!(game: panam_running , player: antoine, ranking: 1)
gp2 = GamePlayer.create!(game: panam_running , player: mickael, ranking: 2)
gp3 = GamePlayer.create!(game: panam_running , player: xavier, ranking: 3)
gp4 = GamePlayer.create!(game: panam_running , player: paul, ranking: 4)


# Autres jeux
gp5 = GamePlayer.create!(game: city_marathon, player: antoine, ranking: 1)
gp6 = GamePlayer.create!(game: city_marathon, player: mickael, ranking: 2)
gp7 = GamePlayer.create!(game: city_marathon, player: xavier, ranking: 3)
gp9 = GamePlayer.create!(game: city_marathon, player: paul, ranking: 4)

gp10 = GamePlayer.create!(game: beach_running , player: taib, ranking: 1)

gp11 = GamePlayer.create!(game: antourun , player: antoine, ranking: 1)
gp12 = GamePlayer.create!(game: antourun , player: carlos, ranking: 1)






puts "GamePlayers créés !"









###################################### SEEED CHATGPT###############################

# =========================================================
# Définition des jeux manuellement avec dates en dur
# =========================================================

# Jeu 1 : Paris
game_1 = Game.create!(
  name: "Battle des collègues",
  map_polyline: "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
  nb_of_players: 8,
  start_date: "2024-11-15",
  end_date: "2024-12-24",
  status: 'ongoing',
  latitude: 48.8566,
  longitude: 2.3522
)

# Association des joueurs pour le jeu 1
GamePlayer.create!(game: game_1, player: carlos)
GamePlayer.create!(game: game_1, player: mickael)
GamePlayer.create!(game: game_1, player: antoine)
GamePlayer.create!(game: game_1, player: taib)
GamePlayer.create!(game: game_1, player: paul)
GamePlayer.create!(game: game_1, player: xavier)
GamePlayer.create!(game: game_1, player: gustave)
GamePlayer.create!(game: game_1, player: camille)

game_1_1 = Game.create!(
  name: "Who rules Paris?",
  map_polyline: "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
  nb_of_players: 8,
  start_date: "2024-07-15",
  end_date: "2025-01-20",
  duration: 155,
  status: 'finish',
  latitude: 48.8566,
  longitude: 2.3522
)

# Association des joueurs pour le jeu 1
GamePlayer.create!(game: game_1_1, player: carlos)
GamePlayer.create!(game: game_1_1, player: mickael)
GamePlayer.create!(game: game_1_1, player: antoine)
GamePlayer.create!(game: game_1_1, player: taib)
GamePlayer.create!(game: game_1_1, player: paul)
GamePlayer.create!(game: game_1_1, player: xavier)
GamePlayer.create!(game: game_1_1, player: gustave)
GamePlayer.create!(game: game_1_1, player: camille)

# Jeu 2 : Lyon
game_2 = Game.create!(
  name: "Lyon Run 1",
  map_polyline: "_smvGi|j\\bcA|jBt|Cj{BzlEshBnnF}`D]y{BhFuyBaS_|C_JqaEiAyfDcTwkCwh@c_Cw}Bos@ooCbMi_Bx@gtB`m@_cArlBwt@t~Aab@fsBec@b}DcNbrDjSnyDfzAdwD",
  nb_of_players: 6,
  duration: 71,
  status: 'pending',
  latitude: 45.7640,
  longitude: 4.8357
)

# Association des joueurs pour le jeu 2
GamePlayer.create!(game: game_2, player: carlos)
GamePlayer.create!(game: game_2, player: mickael)
GamePlayer.create!(game: game_2, player: antoine)
GamePlayer.create!(game: game_2, player: taib)
GamePlayer.create!(game: game_2, player: paul)

# Jeu 3 : Marseille
game_3 = Game.create!(
  name: "Marseille Run 1",
  map_polyline: "{kvfGkhm`@_mH}vHioGkJclIbrAw]~yJ{hDj}N`Q~eE|}DbjAxwFghFh_Ev~Al{A_pCzuBoAf_EbfE`w@_nCeRkqLnPacG",
  nb_of_players: 5,
  start_date: "2024-09-05",
  end_date: "2025-01-02",
  status: 'ongoing',
  latitude: 43.2965,
  longitude: 5.3698
)


marseille_carlos_1 = Run.create!(
  name: 'inside loop',
  start_datetime: "2024-12-09 17:00:00",
  end_datetime: "2024-12-09 18:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "ucdgGmbv_@`bAsjBjyBik@leCdsA`u@quE{KgfFqaCitAhOluGy{BeaBgvA{Q}n@|}BoQ|sCtZr`D",
  strava_activity_id: 123165781649128,
  player: carlos
)

marseille_anto_1 = Run.create!(
  name: 'Quartiers Nord',
  start_datetime: "2024-12-09 18:00:00",
  end_datetime: "2024-12-09 19:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "azigGgay_@_rA}DijAzP_g@qtArE}w@aAghAyb@dzAhU~nCzgAvm@ls@m^xk@qa@bd@cK",
  strava_activity_id: 123165781649128,
  player: antoine
)

marseille_taib_1 = Run.create!(
  name: 'Calanques Run',
  start_datetime: "2024-12-09 20:00:00",
  end_datetime: "2024-12-09 21:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "iwhgGk~~_@iL}kAuEsg@sh@pIog@nFkZ?xSra@hYdc@jM~lCfAppB~aA}Xg@}gE",
  strava_activity_id: 123165781649128,
  player: taib
)

marseille_micka_1 = Run.create!(
  name: 'Calanques Run',
  start_datetime: "2024-11-09 20:00:00",
  end_datetime: "2024-11-09 21:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "wadgGu`{_@t`@t]~oAaDhnAoxAcSsgB}kBkN_dAtgA`CdnB",
  strava_activity_id: 123165781649128,
  player: mickael
)

# Association des joueurs pour le jeu 3
GamePlayer.create!(game: game_3, player: carlos)
GamePlayer.create!(game: game_3, player: mickael)
GamePlayer.create!(game: game_3, player: antoine)
GamePlayer.create!(game: game_3, player: taib)
GamePlayer.create!(game: game_3, player: paul)

# Jeu 4 : Lille
game_4 = Game.create!(
  name: "Courir se mettre au chaud",
  map_polyline: "qu~sH{dnQnm@eeBrEerB?kjByk@gf@maAsAkuAvp@}WdgC|\\jlCnjChf@",
  nb_of_players: 3,
  start_date: "2024-08-01",
  end_date: "2024-11-20",
  duration: 109,
  status: 'finish',
  latitude: 50.6292,
  longitude: 3.0573
)

lille_ant_1 = Run.create!(
  name: 'Calanques Run',
  start_datetime: "2024-11-09 20:00:00",
  end_datetime: "2024-11-09 21:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "at}sHitsQ}BmfB{pAsW}a@~qBzdAx{Azq@wnA",
  strava_activity_id: 123165781649128,
  player: antoine
)
lille_mick_1 = Run.create!(
  name: 'Training Lille',
  start_datetime: "2024-11-09 20:00:00",
  end_datetime: "2024-11-09 21:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "og~sHgtqQlSabDol@}Xsz@jLcv@tl@e@v_B~c@zs@jx@b`@rm@ys@",
  strava_activity_id: 123165781649128,
  player: mickael
)

lille_karl_1 = Run.create!(
  name: 'Petit EF Run',
  start_datetime: "2024-11-09 20:20:00",
  end_datetime: "2024-11-09 21:10:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "ye~sHgipQ`P}PkJ}a@si@uReQcXqXwI|BydAwf@_Q{ZzY}Frd@|Jrm@xIwI~[wIvI|{@x^jUp\\?l[hV",
  strava_activity_id: 1231657816491238,
  player: carlos
)


# Association des joueurs pour le jeu 4
GamePlayer.create!(game: game_4, player: carlos)
GamePlayer.create!(game: game_4, player: mickael)
GamePlayer.create!(game: game_4, player: antoine)


# Jeu 5 : Toulouse
game_5 = Game.create!(
  name: "Stade Toulousain fight",
  map_polyline: "indiGurrG~`BjCn~@ohBqFgfCur@i}@i|@~D_fApe@qFdlArd@|oD",
  nb_of_players: 4,
  duration: 40,
  status: 'pending',
  latitude: 43.6047,
  longitude: 1.4442
)

# Association des joueurs pour le jeu 5
GamePlayer.create!(game: game_5, player: carlos)
GamePlayer.create!(game: game_5, player: mickael)
GamePlayer.create!(game: game_5, player: antoine)


# Jeu 6 : Rilly-sur-Loire
game_6 = Game.create!(
  name: "Rilly-sur-Loire Run 1",
  map_polyline: "oxm`H}hdEfdCajA~oCgtFxbAcrL{d@}cS_tAmrGotFcZ{lHz{AypB`yAkhB~hQzx@baM~^rrC|}BjeEh`DlbCfdDlE",
  nb_of_players: 2,
  start_date: "2022-12-10",
  end_date: "2024-01-15",
  duration: 93,
  status: 'finish',
  latitude: 47.3705,
  longitude: 0.8355
)

# Association des joueurs pour le jeu 6
GamePlayer.create!(game: game_6, player: carlos)
GamePlayer.create!(game: game_6, player: mickael)



rilly_run_carlos= Run.create!(
  name: 'Evening run au soleil',
  start_datetime: "2024-12-20 20:07:00",
  end_datetime: "2024-12-20 21:30:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "gs_Fajv`HngArJh_Ah`@uh@h{@ifAraByyAXir@am@{t@us@ln@wdAh_@e_@ti@u]vp@tY",
  strava_activity_id: 123165781649129,
  player: carlos
)

rilly_run_micka= Run.create!(
  name: 'Morning run Micka',
  start_datetime: "2024-12-20 20:10:00",
  end_datetime: "2024-12-20 21:39:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "}s~Eccm`HyqAec@mv@_[`_FwzDn}G|jBum@feB{zBvl@whE_C",
  strava_activity_id: 123165781649129,
  player: mickael
)


rilly_run_carlos2= Run.create!(
  name: 'Sortie EF',
  start_datetime: "2024-12-18 20:10:00",
  end_datetime: "2024-12-18 21:39:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "yenEaeq`Hiq@`kCezFdpCo`B_d@~AinAtuFmxDhtCnO",
  strava_activity_id: 123165781649129,
  player: carlos
)











###################################### SEEED CHATGPT###############################
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
  player: xavier
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

# outside_loop = Run.create!(
#   name: 'outside loop',
#   start_datetime: "2024-12-01 19:00:00",
#   end_datetime: "2024-12-01 20:00:00",
#   start_lat: 48.83043048328835,
#   end_lat: 48.83043048328835,
#   start_long: 2.3517822591304025,
#   end_long: 2.3517822591304025,
#   polyline:   "mmciHmg{LJUBQ^gAV}@Pa@r@cCLm@LUBSHOBOIQMKI[BOLYLg@@SAWB[DUCs@M{@Di@Cg@@YIq@Ae@KaA@KCeCF]C]G[@IAOQoA?e@Ec@J_BAU@_@IY?g@JqCES?]KYM{@Ek@B_@?g@Ky@Da@E]?_@Lc@AKCG?SCQG[?e@Eg@@SGO?q@E]B_@FU?K?IKUCmAB[Ia@?]Hk@?K_@mCAq@@WEg@BKC_@EUQ_@Gg@IUM{AFuADQDa@DkBDQAOFqAAa@KmA@YE]Ae@Ia@@YK_@I_ALw@Cc@I]EIOGKK[e@K[MWE[EIe@Oc@q@YYMYWWg@w@GGe@Wk@fAK`@KRKZEXg@fAEXSd@Ib@IfA]vAGh@GPKJMv@IJMd@Wd@Ih@Yh@i@nAI^GDIv@QTENGFQ^SJOPQDOZETKFOVYPoA|AMHG?CFGAg@f@QDIPOFEF?LEPMHILQFILWRIDG?MFW\\E@SRY\\IFQRW^k@h@QHW^KDM?KBG^CCCBEN@b@GXYXKBMNKBaB~AMRq@r@UPe@f@MFc@f@OTCNQTQXH`@@XBHn@f@Xt@PFPPF@NXH\\TXJPHFNNHPb@l@P`@TVPLLb@d@h@RFRZN`BEd@Dp@A`@BHB^?^B`@A`@Ed@BH?PDF?PEf@A`AH~@Cf@OjADp@E^BN?Z?JTv@BRBD?LLt@HLBRWh@GDCHIJGPYHITUd@Gb@MRMDIXYd@CHEFSLYv@ETGJ[FMHS@MVc@f@Ij@Af@I^Ad@U|@Q`@GV_@p@k@t@QJCFOPG@CFCH?h@K\\SP?JLTNNLXZj@Zt@FZZp@l@x@FR\\h@Lb@JLRj@HPNLJVFXJR^ZJBPLHJPLPTLFTZRHf@x@DDTHn@bANLH@f@?VFRXLHRBFBNBXLTZj@j@\\RHEH@RKd@e@TKNANGV[Zo@ZMV_@",
#   strava_activity_id: 123165781649126,
#   player: antoine
# )

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

# test_greg = Run.create!(
#   name: 'test-greg',
#   start_datetime: "2024-12-09 20:00:00",
#   end_datetime: "2024-12-09 21:00:00",
#   start_lat: 48.83043048328835,
#   end_lat: 48.83043048328835,
#   start_long: 2.3517822591304025,
#   end_long: 2.3517822591304025,
#   polyline:   "k_iiHsbiMvCZTCzAXfACv@NlA\\VPd@Bn@GXLf@Er@\\TBPd@Dp@?n@Ad@QlASj@RR^PlARRPj@NL?XUN@ZNLXl@JNX^@b@Jl@b@f@CLLBJPAFJb@ZP@`@RLAVPPOVAXXfA`@l@JPJf@@j@Z|Cz@\\ZBnBZ|AGp@WpADj@D?T[VEj@^`@\\`@d@tARh@KZFh@Xn@Jb@XVK|@l@jB`A`@f@VDR`@@j@FPIbAh@h@FPLDBTYr@G^e@~@Gd@JXRJ~@J|BhA~@VjBrBf@\\p@TJRj@EXYVcANsAb@iCNs@?Qd@iBHaALaCDgAAy@RmAT}@L}CJkA?cAH{@Po@@o@ZkBVeCAg@DWLSXkBPi@?SjAcFDq@Nm@@[Jg@H}@l@sCRkAFw@`AuEN_ANsA\\oAn@{AHi@JOr@}DRg@PIb@eATu@RcAHw@d@uBRYLo@\\w@\\k@F[h@qAb@uA^uAb@cC`AgDBa@Vu@PoAn@wAl@mB^sBVi@tAkFL_@Zc@z@Y|BOXPVDTUnA?zAc@`BkBTO|BmA~Bw@NOIsAF[DEHF@MWuDHCZYHUPQRm@W]F]CYEG?MT]`ABNWeALsAuASEYYQAQU[Cm@[WCQOe@IoAq@GM[Qq@Ak@[]?_@]e@Og@A]Wm@MUOQ?USs@YoBm@k@]S]g@]i@w@iAm@e@aAM@{@w@e@GCG_@Me@i@iAm@iBQOWk@KKK_AUe@a@QCe@_@_@CSOe@S]Ay@OMOq@Sa@_@i@O[Ba@Mk@[SEMMY?WS_AUMOaASc@Q]Ye@Oq@@}@YcAC[JgAGq@Lg@^q@Vi@d@_AZ}@t@a@Li@VMXO@c@^q@Z]Ri@f@c@Z_@NSVm@Ry@l@SBk@j@i@Vw@bA}Ar@gBvA_@Fc@b@_B~@w@t@i@ZSVk@ZKNa@LYTQBs@p@iAz@c@PGNYCi@f@UZaAr@OYEAM`@{@l@q@n@WEuA|Aw@PIN{@j@S\\GBEPe@d@m@eAm@w@AO]SEWQQO]?[U]GWWM_@e@So@_AkBUWGYMKYm@a@k@Qi@W[Wi@SMMSIWGEAU[WEiA@cAD{@?}@Mw@RUEm@@gA",
#   strava_activity_id: 123165781649129,
#   player: carlos
# )



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

petite_boucle_domicile= Run.create!(
  name: 'petite boucle à domicile',
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


# Notification.create!(title: "New Game Added", content: "A new game has been added to your favorites.Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#   Aliquam consectetur venenatis blandit. Praesent vehicula, libero non pretium vulputate,
#   lacus arcu facilisis lectus, sed feugiat tellus nulla eu dolor.
#   Nulla porta bibendum lectus quis euismod. Aliquam volutpat ultricies porttitor.
#   Cras risus nisi, accumsan vel cursus ut, sollicitudin vitae dolor. Fusce scelerisque eleifend lectus in bibendum.
#   Suspendisse lacinia egestas felis a volutpat.", created_at: 2.hours.ago, player: taib)

# Notification.create!(title: "Add me to your game buddy", content: "Man, it would be great to add me to your game, it'll be challenging", created_at: 1.hour.ago, player: taib)
# Notification.create!(title: "Let's do some cardio", content: "Man, it promise it would be great to add me to your game, i swear to god", created_at: 1.hour.ago, player: taib)


# Notification.create!(title: "Game Reminder", content: "Don't forget your upcoming game tomorrow.", created_at: 1.day.ago, player: carlos)
# Notification.create!(title: "Achievement Unlocked", content: "You unlocked the 'Marathon Master' badge!", created_at: 3.days.ago, player: antoine)
