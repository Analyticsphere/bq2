/*
Objective:
  Select all non-PII variables from module3_v1_JP.

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
  b.Connect_ID, 
	b.D_101170268, 
	b.D_101710639, 
	b.D_103045461, 
	b.D_103566006_D_103566006_D_123926260, 
	b.D_103566006_D_103566006_D_741643840, 
	b.D_103566006_D_103566006_D_807835037, 
	b.D_103566006_D_103566006_D_959535900, 
	b.D_103566006_D_325879966, 
	b.D_115909186, 
	b.D_116014097, 
	b.D_116080663_D_116080663_D_648960871, 
	b.D_116080663_D_889949861, 
	b.D_116510981, 
	b.D_119257304, 
	b.D_119378795, 
	b.D_127871793, 
	b.D_129677435, 
	b.D_133396976, 
	b.D_140848765, 
	b.D_142164107, 
	b.D_145078867, 
	b.D_146319128, 
	b.D_146877593, 
	b.D_147028925, 
	b.D_154603497_D_154603497_D_648960871, 
	b.D_154603497_D_234430294, 
	b.D_171050898, 
	b.D_175568583, 
	b.D_175995366, 
	b.D_177252178, 
	b.D_178242940, 
	b.D_178665310, 
	b.D_179510070, 
	b.D_180308733, 
	b.D_182431332, 
	b.D_183546626, 
	b.D_194557808, 
	b.D_197309242, 
	b.D_199612020, 
	b.D_204884007, 
	b.D_208578552, 
	b.D_210016366, 
	b.D_213679054, 
	b.D_227439141, 
	b.D_228752045, 
	b.D_237415094, 
	b.D_238422161, 
	b.D_238953261, 
	b.D_241771440, 
	b.D_242276545, 
	b.D_242987943, 
	b.D_243519559, 
	b.D_250456537, 
	b.D_252017075_D_106272739, 
	b.D_252017075_D_106272739_sm, 
	b.D_252017075_D_257564920, 
	b.D_252017075_D_257564920_sm, 
	b.D_252017075_D_359443374, 
	b.D_252017075_D_359443374_sm, 
	b.D_252017075_D_670036093, 
	b.D_252017075_D_670036093_sm, 
	b.D_254689566, 
	b.D_254739443, 
	b.D_257300783_D_257300783_D_648960871, 
	b.D_257300783_D_424527685, 
	b.D_258291510, 
	b.D_258703325, 
	b.D_259481608, 
	b.D_265469878_D_265469878, 
	b.D_265469878_D_781650542, 
	b.D_268240612_D_268240612, 
	b.D_268240612_D_531654334, 
	b.D_268407776, 
	b.D_276575533_D_276575533, 
	b.D_276575533_D_810608313, 
	b.D_286598574, 
	b.D_287715042, 
	b.D_304657762, 
	b.D_306320432, 
	b.D_311569789, 
	b.D_318569032, 
	b.D_319397722, 
	b.D_325229459, 
	b.D_327050687, 
	b.D_333072838, 
	b.D_334292580, 
	b.D_336810811, 
	b.D_337810964, 
	b.D_338467033, 
	b.D_344583659, 
	b.D_344631681, 
	b.D_345457702, 
	b.D_352986465, 
	b.D_355689185, 
	b.D_356470028, 
	b.D_360277949, 
	b.D_363377579, 
	b.D_365370279, 
	b.D_370253256, 
	b.D_370352501, 
	b.D_370901901, 
	b.D_372398512, 
	b.D_375227733, 
	b.D_377064836_D_377064836, 
	b.D_377064836_D_779642303, 
	b.D_378254382_D_378254382_D_648960871, 
	b.D_378254382_D_628818510, 
	b.D_381268397, 
	b.D_383748300, 
	b.D_384562783, 
	b.D_385490512, 
	b.D_386950237, 
	b.D_387489930, 
	b.D_388614168, 
	b.D_394049992, 
	b.D_394410256, 
	b.D_395480458, 
	b.D_399659169, 
	b.D_400969127, 
	b.D_402300898, 
	b.D_405178123, 
	b.D_411088265, 
	b.D_411960217, 
	b.D_417552256, 
	b.D_420155119, 
	b.D_429228540, 
	b.D_434034366, 
	b.D_442002787, 
	b.D_444759994, 
	b.D_445187084, 
	b.D_445537380, 
	b.D_445712879, 
	b.D_447720598_D_181769837, 
	b.D_447720598_D_549079588, 
	b.D_447720598_D_889023234, 
	b.D_447720598_D_896953195, 
	b.D_448968121, 
	b.D_450151555, 
	b.D_457290610, 
	b.D_458395129, 
	b.D_459096272, 
	b.D_463908980, 
	b.D_466473224, 
	b.D_467751479, 
	b.D_470862706_D_178609656_D_104676242, 
	b.D_470862706_D_178609656_D_137733407, 
	b.D_470862706_D_178609656_D_663253668, 
	b.D_470862706_D_178609656_D_789689151, 
	b.D_470862706_D_261957180_D_104676242, 
	b.D_470862706_D_261957180_D_137733407, 
	b.D_470862706_D_261957180_D_663253668, 
	b.D_470862706_D_261957180_D_789689151, 
	b.D_470862706_D_356133766_D_104676242, 
	b.D_470862706_D_356133766_D_137733407, 
	b.D_470862706_D_356133766_D_663253668, 
	b.D_470862706_D_356133766_D_789689151, 
	b.D_470862706_D_643512687_D_104676242, 
	b.D_470862706_D_643512687_D_137733407, 
	b.D_470862706_D_643512687_D_663253668, 
	b.D_470862706_D_643512687_D_789689151, 
	b.D_470862706_D_688123102_D_104676242, 
	b.D_470862706_D_688123102_D_137733407, 
	b.D_470862706_D_688123102_D_663253668, 
	b.D_470862706_D_688123102_D_789689151, 
	b.D_470862706_D_690918725_D_104676242, 
	b.D_470862706_D_690918725_D_137733407, 
	b.D_470862706_D_690918725_D_663253668, 
	b.D_470862706_D_690918725_D_789689151, 
	b.D_470862706_D_715827646_D_104676242, 
	b.D_470862706_D_912659087_D_104676242, 
	b.D_470862706_D_912659087_D_137733407, 
	b.D_470862706_D_912659087_D_663253668, 
	b.D_470862706_D_912659087_D_789689151, 
	b.D_471435289, 
	b.D_472007171, 
	b.D_480155628, 
	b.D_480217113, 
	b.D_480426504, 
	b.D_481182460, 
	b.D_481662464, 
	b.D_492742957, 
	b.D_493642768, 
	b.D_495592561, 
	b.D_501545129, 
	b.D_503058092, 
	b.D_510183971, 
	b.D_511145980, 
	b.D_515023660, 
	b.D_517100968_D_517100968, 
	b.D_517100968_D_810608313, 
	b.D_521073718, 
	b.D_524914900, 
	b.D_524971659, 
	b.D_525152373, 
	b.D_532755074, 
	b.D_534351312, 
	b.D_536166591, 
	b.D_537807075, 
	b.D_546410473_D_546410473_D_648960871, 
	b.D_546410473_D_663551714, 
	b.D_549400618, 
	b.D_550244580_D_517801904, 
	b.D_550244580_D_550244580_D_648960871, 
	b.D_550850568, 
	b.D_556837046_D_141874857, 
	b.D_556837046_D_556837046_D_648960871, 
	b.D_556963634, 
	b.D_558707243, 
	b.D_559388168, 
	b.D_560293868, 
	b.D_562595294, 
	b.D_564438246, 
	b.D_568113091, 
	b.D_584608368, 
	b.D_585702271, 
	b.D_585819411_D_585819411, 
	b.D_585819411_D_810608313, 
	b.D_589885595, 
	b.D_591438156, 
	b.D_592957464, 
	b.D_594280517, 
	b.D_594608533, 
	b.D_596004621, 
	b.D_598954337, 
	b.D_605063358, 
	b.D_606675249, 
	b.D_618062863, 
	b.D_620425840, 
	b.D_622210148, 
	b.D_624111331, 
	b.D_628770824, 
	b.D_633553324_D_164707243, 
	b.D_633553324_D_164707243_sm, 
	b.D_633553324_D_175385712, 
	b.D_633553324_D_175385712_sm, 
	b.D_633553324_D_294629316, 
	b.D_633553324_D_602102163, 
	b.D_633553324_D_771426895, 
	b.D_633553324_D_771426895_sm, 
	b.D_633553324_D_772143730, 
	b.D_633553324_D_772143730_sm, 
	b.D_633553324_D_818310825, 
	b.D_633553324_D_818310825_sm, 
	b.D_633553324_D_843593800, 
	b.D_633553324_D_843593800_sm, 
	b.D_639684251, 
	b.D_640944113, 
	b.D_643099118, 
	b.D_645361463, 
	b.D_645681293, 
	b.D_648216681, 
	b.D_652477674, 
	b.D_653198444_D_622843252, 
	b.D_653198444_D_653198444_D_648960871, 
	b.D_656911826, 
	b.D_659140794, 
	b.D_662762705, 
	b.D_667002790, 
	b.D_671380198, 
	b.D_673842048, 
	b.D_674378360, 
	b.D_677733128, 
	b.D_679300202, 
	b.D_681586194, 
	b.D_685659661, 
	b.D_694261722, 
	b.D_695423703, 
	b.D_698314386, 
	b.D_700173707, 
	b.D_702729897, 
	b.D_705282587, 
	b.D_711858159, 
	b.D_716554850, 
	b.D_719293094, 
	b.D_720305356, 
	b.D_722122662, 
	b.D_723763329, 
	b.D_724079256, 
	b.D_724239872, 
	b.D_724990284, 
	b.D_726847824, 
	b.D_738219521_D_392301875, 
	b.D_738219521_D_392301875_sm, 
	b.D_738219521_D_509170471, 
	b.D_738219521_D_575237218, 
	b.D_738219521_D_575237218_sm, 
	b.D_738219521_D_576358766, 
	b.D_738219521_D_576358766_sm, 
	b.D_738219521_D_666840938, 
	b.D_738219521_D_666840938_sm, 
	b.D_738219521_D_767711152, 
	b.D_738219521_D_767711152_sm, 
	b.D_738219521_D_888898065, 
	b.D_738219521_D_888898065_sm, 
	b.D_738219521_D_976863738, 
	b.D_738219521_D_976863738_sm, 
	b.D_742254559_D_185168695, 
	b.D_742254559_D_742254559_D_648960871, 
	b.D_742544044, 
	b.D_746817928, 
	b.D_751046675, 
	b.D_752795304, 
	b.D_755298453, 
	b.D_755923078_D_459020144, 
	b.D_755923078_D_755923078, 
	b.D_761037053, 
	b.D_763164658, 
	b.D_766791333, 
	b.D_777877159, 
	b.D_780685299, 
	b.D_780721084, 
	b.D_780767323, 
	b.D_785139115, 
	b.D_786517174, 
	b.D_787047261, 
	b.D_789159346_D_214983579, 
	b.D_789159346_D_789159346_D_572260608, 
	b.D_789159346_D_789159346_D_732465277, 
	b.D_789159346_D_789159346_D_807835037, 
	b.D_789159346_D_789159346_D_895826652, 
	b.D_789271762, 
	b.D_790436165_D_408696162, 
	b.D_790436165_D_790436165_D_648960871, 
	b.D_795265404, 
	b.D_795761911, 
	b.D_798549704, 
	b.D_798627028, 
	b.D_810324917_D_479400169, 
	b.D_810324917_D_810324917, 
	b.D_812430894, 
	b.D_814115676_D_814115676_D_648960871, 
	b.D_814115676_D_851145096, 
	b.D_815776236, 
	b.D_816891201, 
	b.D_818380721, 
	b.D_820220019, 
	b.D_821629868, 
	b.D_827661413, 
	b.D_830608495_D_158841370, 
	b.D_830608495_D_349034127, 
	b.D_830608495_D_535003378, 
	b.D_830608495_D_675129470, 
	b.D_830608495_D_713594719, 
	b.D_830608495_D_760521319, 
	b.D_831873859, 
	b.D_845122623, 
	b.D_847277590, 
	b.D_857219333, 
	b.D_858858333, 
	b.D_859228803, 
	b.D_863593410, 
	b.D_863664828, 
	b.D_864290328, 
	b.D_868868325, 
	b.D_872821562, 
	b.D_878281875, 
	b.D_880067330, 
	b.D_891825638, 
	b.D_891996278, 
	b.D_908399883, 
	b.D_910501158, 
	b.D_915293401, 
	b.D_921623945, 
	b.D_921663542, 
	b.D_922708844, 
	b.D_923371868, 
	b.D_925215135, 
	b.D_928803137, 
	b.D_929034795, 
	b.D_930208825, 
	b.D_933417196_D_810608313, 
	b.D_933417196_D_933417196, 
	b.D_937550939, 
	b.D_938333920, 
	b.D_942945860_D_742716427, 
	b.D_942945860_D_942945860_D_648960871, 
	b.D_947205597_D_198133418, 
	b.D_947205597_D_535003378, 
	b.D_947205597_D_539648641, 
	b.D_947205597_D_686310465, 
	b.D_947205597_D_706254326, 
	b.D_947205597_D_712653855, 
	b.D_947205597_D_817381897, 
	b.D_951151270, 
	b.d_951528844, 
	b.D_951901114, 
	b.D_960332453, 
	b.D_963040791, 
	b.D_964154290, 
	b.D_970325871, 
	b.D_981755099, 
	b.D_982470672, 
	b.D_989594002, 
	b.D_992757226, 
	b.D_995220236, 
	b.D_997412869, 
	b.sha, 
	b.uid, 
	b.date
FROM 
  `nih-nci-dceg-connect-prod-6d04.FlatConnect.module3_v1_JP` b
INNER JOIN `nih-nci-dceg-connect-prod-6d04.FlatConnect.participants_JP` p
  ON cast(b.Connect_ID as int64) = cast(p.Connect_ID as int64)
WHERE 
  p.d_821247024 = '197316935'      -- is verified
  AND p.d_747006172 != '353358909' -- has not withdrawn consent