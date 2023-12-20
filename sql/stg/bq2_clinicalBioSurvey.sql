/*
Objective:
  Select all non-PII variables from clinicalBioSurvey_v1_JP.

  For participants to be included:
   - Verification Status [821247024] MUST BE verified
   - Consent Withdrawn [747006172] MUST NOT be YES [353358909]
 
Note:
      This SQL query was generated by generate_bq2_queries.qmd. This code 
      lives in a GitHub repo (https://github.com/Analyticsphere/bq2). The 
      code was written by Jing Wu and edited by Jake Peters. The BQ2 tables 
      that are generated in this query are currated and maintained by Jake 
      Peters, Jing Wu and Rebecca Sansale. Other details will be documented here..
*/

SELECT 
  b.__has_error__, 
	b.Connect_ID, 
	b.D_108733102_1_1, 
	b.D_108733102_2_2, 
	b.D_108733102_3_3, 
	b.D_108733102_4_4, 
	b.D_108733102_5_5, 
	b.D_108733102_6_6, 
	b.D_110872086_D_110872086, 
	b.D_110872086_D_637540387, 
	b.D_112151599, 
	b.D_114280729_D_108389123, 
	b.D_114280729_D_109223043, 
	b.D_114280729_D_336856410, 
	b.D_114280729_D_368669706, 
	b.D_114280729_D_374567479, 
	b.D_114280729_D_481587023, 
	b.D_114280729_D_518602598, 
	b.D_114280729_D_590361055, 
	b.D_114280729_D_605818246, 
	b.D_114280729_D_702905707, 
	b.D_114280729_D_747085418, 
	b.D_114280729_D_770190369, 
	b.D_114280729_D_790860504, 
	b.D_114280729_D_966214244, 
	b.D_114280729_D_986119909, 
	b.D_114280729_D_994153376, 
	b.D_130311122, 
	b.D_136730307_D_126794793, 
	b.D_136730307_D_218793117, 
	b.D_136730307_D_338613869, 
	b.D_136730307_D_962475128, 
	b.D_136730307_D_989576239, 
	b.D_169509213_1_1, 
	b.D_179406442_1_1, 
	b.D_179406442_2_2, 
	b.D_179406442_4_4, 
	b.D_191057574, 
	b.D_191057574_V2, 
	b.D_220055064_1_1_D_220055064_1_1, 
	b.D_220055064_1_1_D_395747093_1_1, 
	b.D_220055064_10_10_D_220055064_10_10, 
	b.D_220055064_2_2_D_220055064_2_2, 
	b.D_220055064_2_2_D_395747093_2_2, 
	b.D_220055064_3_3_D_220055064_3_3, 
	b.D_220055064_3_3_D_395747093_3_3, 
	b.D_220055064_4_4_D_220055064_4_4, 
	b.D_220055064_4_4_D_395747093_4_4, 
	b.D_220055064_5_5_D_220055064_5_5, 
	b.D_220055064_5_5_D_395747093_5_5, 
	b.D_220055064_6_6_D_220055064_6_6, 
	b.D_220055064_6_6_D_395747093_6_6, 
	b.D_220055064_7_7_D_220055064_7_7, 
	b.D_220055064_8_8_D_220055064_8_8, 
	b.D_220055064_9_9_D_220055064_9_9, 
	b.D_220055064_9_9_D_395747093_9_9, 
	b.d_220355297, 
	b.D_234714655, 
	b.D_273371161, 
	b.D_299417266, 
	b.D_299417266_V2, 
	b.D_366980310_1_1, 
	b.D_366980310_2_2, 
	b.D_366980310_3_3, 
	b.D_366980310_4_4, 
	b.D_366980310_5_5, 
	b.D_366980310_6_6, 
	b.D_368715875, 
	b.D_380603392, 
	b.D_389465772_1_1, 
	b.D_389465772_2_2, 
	b.D_389465772_3_3, 
	b.D_389465772_4_4, 
	b.D_389465772_5_5, 
	b.D_389465772_6_6, 
	b.D_424718457_D_157417942, 
	b.D_424718457_D_424718457, 
	b.D_430166879_1_1, 
	b.D_451163824_1_1, 
	b.D_451163824_2_2, 
	b.D_451163824_3_3, 
	b.D_451163824_4_4, 
	b.D_451163824_5_5, 
	b.D_451163824_6_6, 
	b.D_470484596_D_214414872, 
	b.D_470484596_D_235386560, 
	b.D_470484596_D_406943303, 
	b.D_470484596_D_535003378, 
	b.D_470484596_D_756774083, 
	b.D_470484596_D_811126581, 
	b.D_470484596_D_955154600, 
	b.D_487532606_D_520755310, 
	b.D_487532606_D_619765650, 
	b.D_487532606_D_839329467, 
	b.D_494226443, 
	b.D_498462481_1_1, 
	b.D_498462481_2_2, 
	b.D_498462481_3_3, 
	b.D_498462481_4_4, 
	b.D_498462481_5_5, 
	b.D_518916981, 
	b.D_522008539, 
	b.D_563539159, 
	b.D_589004291, 
	b.D_591826144, 
	b.D_644459734, 
	b.D_689861450, 
	b.D_689861450_V2, 
	b.D_694503437_1_1, 
	b.D_694503437_2_2, 
	b.D_694503437_3_3, 
	b.D_694503437_4_4, 
	b.D_694503437_5_5, 
	b.D_694503437_6_6, 
	b.D_705336878_1_1_D_218852075_1_1, 
	b.D_705336878_1_1_D_705336878_1_1_D_160627865, 
	b.D_705336878_1_1_D_705336878_1_1_D_162167690, 
	b.D_705336878_1_1_D_705336878_1_1_D_178318661, 
	b.D_705336878_1_1_D_705336878_1_1_D_283776061, 
	b.D_705336878_1_1_D_705336878_1_1_D_367747257, 
	b.D_705336878_1_1_D_705336878_1_1_D_406943303, 
	b.D_705336878_1_1_D_705336878_1_1_D_423283665, 
	b.D_705336878_1_1_D_705336878_1_1_D_524258008, 
	b.D_705336878_1_1_D_705336878_1_1_D_579409935, 
	b.D_705336878_1_1_D_705336878_1_1_D_653630699, 
	b.D_705336878_1_1_D_705336878_1_1_D_657566099, 
	b.D_705336878_1_1_D_705336878_1_1_D_679368947, 
	b.D_705336878_1_1_D_705336878_1_1_D_684149600, 
	b.D_705336878_1_1_D_705336878_1_1_D_756774083, 
	b.D_705336878_1_1_D_705336878_1_1_D_760243464, 
	b.D_705336878_1_1_D_705336878_1_1_D_807835037, 
	b.D_705336878_1_1_D_705336878_1_1_D_810340693, 
	b.D_705336878_1_1_D_705336878_1_1_D_896163801, 
	b.D_705336878_1_1_D_705336878_1_1_D_960642359, 
	b.D_705336878_2_2_D_218852075_2_2, 
	b.D_705336878_2_2_D_705336878_2_2_D_160627865, 
	b.D_705336878_2_2_D_705336878_2_2_D_162167690, 
	b.D_705336878_2_2_D_705336878_2_2_D_178318661, 
	b.D_705336878_2_2_D_705336878_2_2_D_283776061, 
	b.D_705336878_2_2_D_705336878_2_2_D_367747257, 
	b.D_705336878_2_2_D_705336878_2_2_D_406943303, 
	b.D_705336878_2_2_D_705336878_2_2_D_423283665, 
	b.D_705336878_2_2_D_705336878_2_2_D_524258008, 
	b.D_705336878_2_2_D_705336878_2_2_D_579409935, 
	b.D_705336878_2_2_D_705336878_2_2_D_653630699, 
	b.D_705336878_2_2_D_705336878_2_2_D_657566099, 
	b.D_705336878_2_2_D_705336878_2_2_D_679368947, 
	b.D_705336878_2_2_D_705336878_2_2_D_684149600, 
	b.D_705336878_2_2_D_705336878_2_2_D_756774083, 
	b.D_705336878_2_2_D_705336878_2_2_D_760243464, 
	b.D_705336878_2_2_D_705336878_2_2_D_807835037, 
	b.D_705336878_2_2_D_705336878_2_2_D_810340693, 
	b.D_705336878_2_2_D_705336878_2_2_D_896163801, 
	b.D_705336878_2_2_D_705336878_2_2_D_960642359, 
	b.D_705336878_3_3_D_218852075_3_3, 
	b.D_705336878_3_3_D_705336878_3_3_D_160627865, 
	b.D_705336878_3_3_D_705336878_3_3_D_162167690, 
	b.D_705336878_3_3_D_705336878_3_3_D_178318661, 
	b.D_705336878_3_3_D_705336878_3_3_D_367747257, 
	b.D_705336878_3_3_D_705336878_3_3_D_406943303, 
	b.D_705336878_3_3_D_705336878_3_3_D_423283665, 
	b.D_705336878_3_3_D_705336878_3_3_D_524258008, 
	b.D_705336878_3_3_D_705336878_3_3_D_579409935, 
	b.D_705336878_3_3_D_705336878_3_3_D_653630699, 
	b.D_705336878_3_3_D_705336878_3_3_D_679368947, 
	b.D_705336878_3_3_D_705336878_3_3_D_684149600, 
	b.D_705336878_3_3_D_705336878_3_3_D_756774083, 
	b.D_705336878_3_3_D_705336878_3_3_D_760243464, 
	b.D_705336878_3_3_D_705336878_3_3_D_807835037, 
	b.D_705336878_3_3_D_705336878_3_3_D_810340693, 
	b.D_705336878_3_3_D_705336878_3_3_D_896163801, 
	b.D_705336878_3_3_D_705336878_3_3_D_960642359, 
	b.D_705336878_4_4_D_705336878_4_4_D_160627865, 
	b.D_705336878_4_4_D_705336878_4_4_D_162167690, 
	b.D_705336878_4_4_D_705336878_4_4_D_367747257, 
	b.D_705336878_4_4_D_705336878_4_4_D_406943303, 
	b.D_705336878_4_4_D_705336878_4_4_D_423283665, 
	b.D_705336878_4_4_D_705336878_4_4_D_524258008, 
	b.D_705336878_4_4_D_705336878_4_4_D_579409935, 
	b.D_705336878_4_4_D_705336878_4_4_D_679368947, 
	b.D_705336878_4_4_D_705336878_4_4_D_756774083, 
	b.D_705336878_4_4_D_705336878_4_4_D_760243464, 
	b.D_705336878_4_4_D_705336878_4_4_D_810340693, 
	b.D_705336878_4_4_D_705336878_4_4_D_896163801, 
	b.D_705336878_4_4_D_705336878_4_4_D_960642359, 
	b.D_705336878_5_5_D_705336878_5_5_D_160627865, 
	b.D_705336878_5_5_D_705336878_5_5_D_162167690, 
	b.D_705336878_5_5_D_705336878_5_5_D_178318661, 
	b.D_705336878_5_5_D_705336878_5_5_D_367747257, 
	b.D_705336878_5_5_D_705336878_5_5_D_406943303, 
	b.D_705336878_5_5_D_705336878_5_5_D_423283665, 
	b.D_705336878_5_5_D_705336878_5_5_D_524258008, 
	b.D_705336878_5_5_D_705336878_5_5_D_579409935, 
	b.D_705336878_5_5_D_705336878_5_5_D_653630699, 
	b.D_705336878_5_5_D_705336878_5_5_D_679368947, 
	b.D_705336878_5_5_D_705336878_5_5_D_684149600, 
	b.D_705336878_5_5_D_705336878_5_5_D_756774083, 
	b.D_705336878_5_5_D_705336878_5_5_D_760243464, 
	b.D_705336878_5_5_D_705336878_5_5_D_810340693, 
	b.D_705336878_5_5_D_705336878_5_5_D_896163801, 
	b.D_705336878_5_5_D_705336878_5_5_D_960642359, 
	b.D_705336878_6_6_D_705336878_6_6_D_160627865, 
	b.D_705336878_6_6_D_705336878_6_6_D_162167690, 
	b.D_705336878_6_6_D_705336878_6_6_D_423283665, 
	b.D_705336878_6_6_D_705336878_6_6_D_524258008, 
	b.D_705336878_6_6_D_705336878_6_6_D_679368947, 
	b.D_705336878_6_6_D_705336878_6_6_D_756774083, 
	b.D_705336878_6_6_D_705336878_6_6_D_760243464, 
	b.D_705336878_6_6_D_705336878_6_6_D_810340693, 
	b.D_705336878_6_6_D_705336878_6_6_D_896163801, 
	b.D_715581797_1_1, 
	b.D_715581797_10_10, 
	b.D_715581797_2_2, 
	b.D_715581797_3_3, 
	b.D_715581797_4_4, 
	b.D_715581797_5_5, 
	b.D_715581797_6_6, 
	b.D_715581797_7_7, 
	b.D_715581797_8_8, 
	b.D_715581797_9_9, 
	b.D_715581797_V2_1_1, 
	b.D_715581797_V2_2_2, 
	b.D_715581797_V2_3_3, 
	b.D_715581797_V2_4_4, 
	b.D_715581797_V2_5_5, 
	b.D_715581797_V2_6_6, 
	b.D_715581797_V2_7_7, 
	b.D_744230001_1_1, 
	b.D_744230001_2_2, 
	b.D_744230001_4_4, 
	b.D_749956170_D_143206081, 
	b.D_749956170_D_144819886, 
	b.D_749956170_D_223008071, 
	b.D_749956170_D_246857412, 
	b.D_749956170_D_304155106, 
	b.D_749956170_D_431203595, 
	b.D_749956170_D_463689026, 
	b.D_749956170_D_516899143, 
	b.D_749956170_D_527872064, 
	b.D_749956170_D_599862694, 
	b.D_749956170_D_691752394, 
	b.D_749956170_D_830581863, 
	b.D_749956170_D_860444009, 
	b.D_751358419_D_238135048, 
	b.D_751358419_D_524096053, 
	b.D_751358419_D_632714520, 
	b.D_751358419_D_635026188, 
	b.D_751358419_D_814101706, 
	b.D_775313030_1_1, 
	b.D_775313030_2_2, 
	b.D_775313030_3_3, 
	b.D_775313030_4_4, 
	b.D_775313030_5_5, 
	b.D_775313030_6_6, 
	b.D_782396371_1_1, 
	b.D_782396371_2_2, 
	b.D_782396371_4_4, 
	b.D_798452445, 
	b.D_803339020_1_1, 
	b.D_803339020_2_2, 
	b.D_813989715_D_151327643, 
	b.D_813989715_D_283112988, 
	b.D_813989715_D_440872808, 
	b.D_813989715_D_580629349, 
	b.D_813989715_D_874168085, 
	b.D_813989715_D_874223830, 
	b.D_847578001_D_167695804, 
	b.D_847578001_D_215996690, 
	b.D_847578001_D_462737492, 
	b.D_847578001_D_469675296, 
	b.D_847578001_D_488415137, 
	b.D_847578001_D_730334054, 
	b.D_857165713_D_187399900, 
	b.D_857165713_D_219358831, 
	b.D_857165713_D_243443780, 
	b.D_857165713_D_357462273, 
	b.D_857165713_D_636367178, 
	b.D_857165713_D_638380747, 
	b.D_857165713_D_847529903, 
	b.D_860011428, 
	b.D_867307558, 
	b.D_875535246, 
	b.D_877074400, 
	b.D_877074400_V2, 
	b.D_890156588, 
	b.D_890156588_V2, 
	b.D_893966847_1_1, 
	b.D_893966847_2_2, 
	b.D_893966847_4_4, 
	b.D_928530823_1_1, 
	b.D_928530823_2_2, 
	b.D_928530823_3_3, 
	b.D_928530823_4_4, 
	b.D_928530823_5_5, 
	b.D_928530823_6_6, 
	b.D_930944000_1_1, 
	b.D_930944000_4_4, 
	b.D_934384452, 
	b.D_959877599_D_700620868, 
	b.D_959877599_D_908044428, 
	b.D_980800222_1_1_D_173502329_1_1, 
	b.D_980800222_1_1_D_366972678_1_1, 
	b.D_980800222_2_2_D_173502329_2_2, 
	b.D_980800222_2_2_D_366972678_2_2, 
	b.D_980800222_3_3_D_173502329_3_3, 
	b.D_980800222_3_3_D_366972678_3_3, 
	b.D_980800222_4_4_D_173502329_4_4, 
	b.D_980800222_4_4_D_366972678_4_4, 
	b.D_980800222_5_5_D_173502329_5_5, 
	b.D_980800222_5_5_D_366972678_5_5, 
	b.D_980800222_6_6_D_173502329_6_6, 
	b.D_980800222_6_6_D_366972678_6_6, 
	b.D_984121390_1_1, 
	b.D_984121390_2_2, 
	b.D_984121390_4_4, 
	b.sha, 
	b.treeJSON, 
	b.uid, 
	b.date
FROM 
  `nih-nci-dceg-connect-stg-5519.FlatConnect.clinicalBioSurvey_v1_JP` b
INNER JOIN `nih-nci-dceg-connect-stg-5519.FlatConnect.participants_JP` p
  ON cast(b.Connect_ID as int64) = cast(p.Connect_ID as int64)
WHERE 
  p.d_821247024 = '197316935'      -- is verified
  AND p.d_747006172 != '353358909' -- has not withdrawn consent