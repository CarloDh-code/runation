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
  nb_of_players: 7,
  start_date: "2024-11-26",
  end_date: "2024-12-10",
  status: 'ongoing',
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
  polyline:   "wadiH_j{LwD}DMy@GcB_@kB@eAYwAA}@`CwCdBcDNq@mFwIkCwDc@cAkBeCaCyDgIgN_@g@AODM|AuB@e@b@{AAYoA_DYqC]kAGMsB{
    Ab@eAFg@Ci@Yg@q@DuApCe@lABn@Zh@ZD\\O`BgDLe@As@Kg@YQYHeCrEBfAJNb@R^K|AyCTo@AsA][c@@i@x@aBxCCr@Lh@ZPb@EZa@~Ai
    DD{@Qk@[Qg@RsBhE?`A\\d@^D`B{Bj@wAD_@Ec@Wi@s@F_@f@wAjCMl@@j@HRJN\\F^MnAkBn@gBCs@O_@a@Sa@NqB~DGr@Pn@\\Ph@OjBo
    DFo@W}@c@]c@ViBdECZFr@^`@b@GdAeBz@kBBa@[w@OMc@DwBtDKfAZr@`@DNIvByDJ{@Oi@]UOAa@ZgBjDOv@BZTX\\NXK`@c@tAmCN_AO
    w@a@Ue@PmAjBe@jAGb@@d@Zt@PD^QzAeC`@y@Bq@Ec@KS_@Qc@NgBbDQl@?f@Jb@LLf@F\\[~A_CJ]Fa@WgAOQc@C[ZyAnCOb@Ah@F^d@f@
    f@QbB_DRm@?q@IYo@m@mC~EKr@F`@V\\\\C^W^a@j@mAb@i@NiA[m@YQU@g@b@{ArCIp@Dz@VTb@DNIbBwCXw@@s@Oi@OM_@Ae@b@kB`EKL
    F\\Tj@d@Pb@UjB_EF{@Mc@KO_@G]VqBzDEVFr@b@f@XAjAyBv@iAJi@Ai@[e@k@C]\\kBnDCZFp@T\\VF^MzBcEFk@[u@QO]@YRkBvDEd@B
    d@N^LHh@I|BaED{@Qq@c@O_@P_AlBk@x@Mh@@v@T^b@Jf@[dBeDHu@Mo@SUYEa@Z_BpCSh@Gp@F\\x@`@^SjBuDJm@Cu@_@_@g@DmB~CUr@
    A\\Hr@LP\\HPIdBmCF?KZiB_Bo@jAMh@Ef@D`@\\\\n@MpBkDHy@Ow@[Ya@FwBvDG\\Bv@Vf@^F`@U~A{CJa@Bu@Sk@[Oe@HQT}AdDGd@Ft
    @V\\^DhAkApI`OGp@tA`BfAhB~B`DfAnBNJtA~Dv@x@pApBlBzA`@z@^ZXl@jCnC|@pBFR}@|B_D~FYv@}AtCXh@Db@lAlBPn@r@|@v@rBH
    ZuA~BF^h@T",
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
  polyline: "imciH_g{L`@uAf@kAx@eCh@sA`@Kj@`AhCfCr@d@`AhArKbKjAtAtFpE^`@Tv@vCtDvChCn@PvClDRQt@^fBnAtBhBvHpIR^B\\NDn@
dA`AVhAv@b@d@`@@`ArAHZx@`AdAv@|AdBdA|@x@rBzBlC|BhBdA\\v@GTXvAXzCTh@Lr@?~Ad@|CpCx@xAfB`ChA~Bn@v@nCxF`BxDfAvC
zB`I\\t@Jt@IJAVBJf@r@ZjAv@zBJPUk@GY?Sh@~@Pl@RdBN\\h@^^t@J^FfAN`Ap@jCn@vDKb@AVz@zFZtDRnEHj@fGpHVxBH|BGnAQbAG
rAHnAExDM`CEjC?nDJdB?bCU`AK`AHXAlCHfCPlAx@zAb@|AdArBZ\\b@PBT^f@Vv@vCu@xAk@NHXMdCW`AUXLp@fA^PXKv@DfE]b@LbA[d
A@~Ca@|BE~@DNTN`BZpIp@nNGf@}AdCc@pAgClESz@_@x@{AbCUn@eAhBOf@uAxB]|@WZQh@y@pAU`A]Zc@z@Jg@\\k@j@}A\\e@h@kAj@w
BZu@z@eANELc@VaAvAiBNo@R[Nk@`@y@`B_C`AwBb@u@j@sAl@iAHk@A{@OuAC_AGa@BMS}CEcCMsBCyCIc@S{@{Ij@iBZyBGeBHsB\\c@Q
s@y@[GkHhAoCXi@NIASs@e@k@IYc@Ki@y@Mi@cBaEQk@M_A]mF?uAZmBTm@MiAM{EDyCPmGRcEAy@DsBEwBBk@Ic@@c@Os@G}@Mm@OsCeAP
mAIa@a@Gc@KM_@?g@oF{AwKAWFENeAYiAG_AMy@y@eEM_B}@{A[QGQC]M_@@WkAcF_@yByCyLYe@_@qBq@eC[_@]cA]OUc@[}@aByBc@]MQ
_Ae@a@_@u@eAa@]_@g@{@cBe@g@IJe@c@qBqAc@KsAGiBUm@FwB{@aC]aBgAcB_BkAcBi@c@e@{@aAgAeAy@i@w@kAw@a@c@O@c@To@c@sB
w@c@mAq@iAc@o@[YSa@UOW[GQe@a@MUDUAU_@k@Gc@sAwAK]o@y@eCwBqDaCqBiBi@SsB}BsAkAm@_A]_AiBkAsAaAY]YGu@k@eEgFm@e@}
EoEg@q@[Oc@k@iAaAe@WuAyAgAyAOb@_C|H",
  strava_activity_id: 12975941321,
  player: mickael
)

puts "Runs créés !"




run_1 = Run.create!(
  start_datetime: "2024-11-25 18:40:23",
  end_datetime: "2024-11-25 19:38:27",
  start_lat: 48.848487,
  end_lat: 48.848325,
  start_long: 2.272994,
  end_long: 2.273316,
  polyline:   "wadiH_j{LwD}DMy@GcB_@kB@eAYwAA}@`CwCdBcDNq@mFwIkCwDc@cAkBeCaCyDgIgN_@g@AODM|AuB@e@b@{AAYoA_DYqC]kAGMsB{
    Ab@eAFg@Ci@Yg@q@DuApCe@lABn@Zh@ZD\\O`BgDLe@As@Kg@YQYHeCrEBfAJNb@R^K|AyCTo@AsA][c@@i@x@aBxCCr@Lh@ZPb@EZa@~Ai
    DD{@Qk@[Qg@RsBhE?`A\\d@^D`B{Bj@wAD_@Ec@Wi@s@F_@f@wAjCMl@@j@HRJN\\F^MnAkBn@gBCs@O_@a@Sa@NqB~DGr@Pn@\\Ph@OjBo
    DFo@W}@c@]c@ViBdECZFr@^`@b@GdAeBz@kBBa@[w@OMc@DwBtDKfAZr@`@DNIvByDJ{@Oi@]UOAa@ZgBjDOv@BZTX\\NXK`@c@tAmCN_AO
    w@a@Ue@PmAjBe@jAGb@@d@Zt@PD^QzAeC`@y@Bq@Ec@KS_@Qc@NgBbDQl@?f@Jb@LLf@F\\[~A_CJ]Fa@WgAOQc@C[ZyAnCOb@Ah@F^d@f@
    f@QbB_DRm@?q@IYo@m@mC~EKr@F`@V\\\\C^W^a@j@mAb@i@NiA[m@YQU@g@b@{ArCIp@Dz@VTb@DNIbBwCXw@@s@Oi@OM_@Ae@b@kB`EKL
    F\\Tj@d@Pb@UjB_EF{@Mc@KO_@G]VqBzDEVFr@b@f@XAjAyBv@iAJi@Ai@[e@k@C]\\kBnDCZFp@T\\VF^MzBcEFk@[u@QO]@YRkBvDEd@B
    d@N^LHh@I|BaED{@Qq@c@O_@P_AlBk@x@Mh@@v@T^b@Jf@[dBeDHu@Mo@SUYEa@Z_BpCSh@Gp@F\\x@`@^SjBuDJm@Cu@_@_@g@DmB~CUr@
    A\\Hr@LP\\HPIdBmCF?KZiB_Bo@jAMh@Ef@D`@\\\\n@MpBkDHy@Ow@[Ya@FwBvDG\\Bv@Vf@^F`@U~A{CJa@Bu@Sk@[Oe@HQT}AdDGd@Ft
    @V\\^DhAkApI`OGp@tA`BfAhB~B`DfAnBNJtA~Dv@x@pApBlBzA`@z@^ZXl@jCnC|@pBFR}@|B_D~FYv@}AtCXh@Db@lAlBPn@r@|@v@rBH
    ZuA~BF^h@T",
  strava_activity_id: 12982250051,
  player: carlos
)



### Id run exclu : 12807121651
# Id run inclus : 12316578164

run_exclu = Run.create!(
  start_datetime: "2024-11-27 12:00:00",
  end_datetime: "2024-11-27 13:00:00",
  start_lat: 47.456088,
  end_lat: 47.455965,
  start_long: 1.137482,
  end_long: 1.137597,
  polyline:   "}hs`H}x|EhApAP`@ANOf@J`BJj@pBpF^lAj@vAp@nAX|@fAbFJp@ZjA^hBl@xBp@xAAN]~Au@xCOf@_@z@_AvAoBdDuA~Ak@h@}DvE]b@w@jAg@l@s@n@Y`@]ZoH|Es@\\iAZu@j@W`@y@vB}AfDUpAOr@a@dAAR@B\\FvARd@Db@JV@rAXj@Th@JvA`@tCr@^RRZTj@v@rDp@`Cb@~@jBjCXf@n@`B^pAx@bB|@vB@ZuA~CeChDWj@SXWPuBhAcARKFK@k@C_A[w@?{B^ULIJd@|ARfA^lBjAvEXzA\\tAd@bCx@hDb@fC^~ABRGZwBbE@NNz@Dh@HPNVV`AFf@[l@a@`@a@p@u@r@e@Te@`@y@`@_Az@oBdBc@Vk@L_@TeA`@WTMEGQY{AQs@o@mEEEI@Y^{@ZiAVmBv@i@H_AXQ@YJ_A\\s@`@q@Vg@J_@aAOq@I}CIiA@w@NuB@w@M}AB{CIcCKsBKiACgAEQAs@IeBIUKw@Cg@c@eDCg@e@oDWwDAy@i@yDGqAKgACoASgCGWa@kCUsEOeBFSVWl@YdBa@t@_@d@c@b@Gp@r@FAd@i@lA_Br@uAHUXyAd@oAr@cAb@[j@SLNHB`@IrA@l@K`@KVOb@]x@cAZg@d@_AXeANaA^wAx@gB`AkCRYd@_@zAq@XCn@[TGlAQXIh@[l@g@j@s@z@y@rA_BZ_@vAwBbDqDvDuEd@o@jAuBz@qADMTo@VcAz@eEBYc@w@gAgDmAuFsAuFgAuBgA}C[iAi@oA[}@Kc@MwAFs@HS?MeA_B",
  strava_activity_id: 12807121651,
  player: carlos
)



run_inclus = Run.create!(
  start_datetime: "2024-11-28 12:00:00",
  end_datetime: "2024-11-28 13:00:00",
  start_lat: 48.87619586661458,
  end_lat: 48.876970605924726,
  start_long: 2.332328511402011,
  end_long: 2.333370130509138,
  polyline:   "e}hiHsofMn@{@bAOp@g@bA?p@QRAh@SzAiAPJ@ZLB`@Ab@Rd@JJh@JVdA[h@Nf@X\\V`@HNALJ`@RJJ`@JTLFO^Yb@QD@P`@Zf@`@`AZHHJTZz@fBh@l@tApB^L^Yh@t@h@Vr@Pj@H~@xAXp@T^lA~@\\f@X|@NXf@Nj@|@d@`@PGN?@DKIH{@HeB^kBbBcHFQJMpAuGXw@f@T`@HZb@f@h@T?`@RtA`@l@h@n@z@\\\\r@`@`@\\n@TJKNGVoATi@DAR[RmAj@uFZeCPcBf@mCj@eEF[N_@J_@ZoBJcALuDp@kHJuBDSAe@Fy@VoAX{Ct@sGRqAlBaJZiBJsARqA\\{A`@y@j@iEXaBVo@zCcMN[`@oBRi@TcBP]RgAh@aBf@yBh@iBX[B?JHdArA~@^TLJAHW\\iBn@kCHs@`@eB^{BJWb@{@JwAx@cDJg@n@yBt@_Bl@c@j@Of@FZV[~AOj@Kt@Mj@Up@If@]hAO^]vAQb@Ip@a@jBW\\Op@Iv@g@`BWp@Af@[z@Ub@Mn@AJQn@KJENCVBt@Hb@Dd@RfAFj@AFIDc@NaBXaAX_@Rk@l@iA~@y@nAQh@Yh@UJ{B{AQGSl@_Av@Wt@QdA{@`DAPm@~CIx@K^ILUB[Im@m@a@Yg@O_@[k@[kACmBg@_@FMCKKIWUYe@MUAIMy@o@OCg@WYSk@[e@DKEU_@[M]YMUKCGDKBUK][m@Ie@WYa@g@Ug@e@I?_@TK?OQc@Wu@{@ECc@F_@Kc@[g@m@c@YOCi@@g@_@q@s@cAu@i@Jo@m@k@c@c@Ia@Ba@SYY[Kk@i@mAOsByAQ?IK[E_@Sy@JONUp@YpDSrAm@zCSp@Iv@Ml@OjASt@QlAEf@Cn@QbAE`AQdAG`AKl@u@GW@]GmBHg@Co@@e@IW@QES?s@DcBWi@@EHG?gAU}@I_@?oAK}@Ug@Cs@|Ag@t@i@~AUXQj@QNCN?ZNr@Ht@Mv@S|DBZFNCb@BrAItACbBBvAUhEP~@EnB@PAh@I|A@ZAR]~AF\\@ZItA?`AJtBHv@DHAh@Kz@BXIN",
  strava_activity_id: 12316578164,
  player: carlos
)

# Création des GamePlayerRuns
GamePlayerRun.create!(game_player: gp1, run: run_inclus)
GamePlayerRun.create!(game_player: gp2, run: run_exclu)

puts "GamePlayerRuns créés !"
