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
  map_polyline: 'encoded_polyline_for_beach_running',
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


#Jeu pour test le dessin des runs sur la show avec carlos
gp9 = GamePlayer.create!(game: trail_running_alps, player: antoine, ranking: 1)
gp10 = GamePlayer.create!(game: trail_running_alps, player: taib, ranking: 2)
gp11 = GamePlayer.create!(game: trail_running_alps, player: mickael, ranking: 3)
gp12 = GamePlayer.create!(game: trail_running_alps, player: jean_martial, ranking: 4)




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
  start_datetime: "2024-12-09 19:00:00",
  end_datetime: "2024-12-09 20:00:00",
  start_lat: 48.83043048328835,
  end_lat: 48.83043048328835,
  start_long: 2.3517822591304025,
  end_long: 2.3517822591304025,
  polyline:   "mmciHmg{LJUBQ^gAV}@Pa@r@cCLm@LUBSHOBOIQMKI[BOLYLg@@SAWB[DUCs@M{@Di@Cg@@YIq@Ae@KaA@KCeCF]C]G[@IAOQoA?e@Ec@J_BAU@_@IY?g@JqCES?]KYM{@Ek@B_@?g@Ky@Da@E]?_@Lc@AKCG?SCQG[?e@Eg@@SGO?q@E]B_@FU?K?IKUCmAB[Ia@?]Hk@?K_@mCAq@@WEg@BKC_@EUQ_@Gg@IUM{AFuADQDa@DkBDQAOFqAAa@KmA@YE]Ae@Ia@@YK_@I_ALw@Cc@I]EIOGKK[e@K[MWE[EIe@Oc@q@YYMYWWg@w@GGe@Wk@fAK`@KRKZEXg@fAEXSd@Ib@IfA]vAGh@GPKJMv@IJMd@Wd@Ih@Yh@i@nAI^GDIv@QTENGFQ^SJOPQDOZETKFOVYPoA|AMHG?CFGAg@f@QDIPOFEF?LEPMHILQFILWRIDG?MFW\\E@SRY\\IFQRW^k@h@QHW^KDM?KBG^CCCBEN@b@GXYXKBMNKBaB~AMRq@r@UPe@f@MFc@f@OTCNQTQXH`@@XBHn@f@Xt@PFPPF@NXH\\TXJPHFNNHPb@l@P`@TVPLLb@d@h@RFRZN`BEd@Dp@A`@BHB^?^B`@A`@Ed@BH?PDF?PEf@A`AH~@Cf@OjADp@E^BN?Z?JTv@BRBD?LLt@HLBRWh@GDCHIJGPYHITUd@Gb@MRMDIXYd@CHEFSLYv@ETGJ[FMHS@MVc@f@Ij@Af@I^Ad@U|@Q`@GV_@p@k@t@QJCFOPG@CFCH?h@K\\SP?JLTNNLXZj@Zt@FZZp@l@x@FR\\h@Lb@JLRj@HPNLJVFXJR^ZJBPLHJPLPTLFTZRHf@x@DDTHn@bANLH@f@?VFRXLHRBFBNBXLTZj@j@\\RHEH@RKd@e@TKNANGV[Zo@ZMV_@",
  strava_activity_id: 123165781649126,
  player: paul
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
