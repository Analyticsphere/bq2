-- Notes:
--   [Section 1] Retrieve all of the Raw variables from the participants table here
--   [Section 2] Select Raw variables and Derive New Variables [Do not select any PII here]
--   + ToDo: I don't like that we have to redundantly list the Raw the variables to both sections.
--           We should come up with a way to resolve this eventually for sanity reasons.
-- CREATE OR REPLACE VIEW
--   `nih-nci-dceg-connect-prod-6d04.BQ2.participants` AS -- [1] Common Table Expression (CTE) to retrieve participant data
WITH
	Participants AS (
		SELECT
			Connect_ID,
			token,
			d_100767870,
			d_949302066,
			d_536735468,
			d_663265240,
			d_976570371,
			d_517311251,
			d_832139544,
			d_264644252,
			d_770257102,
			d_684635302,
			d_878865966,
			d_167958071,
			d_173836415_d_266600170_d_915179629,
			d_173836415_d_266600170_d_718172863,
			d_173836415_d_266600170_d_592099155,
			d_173836415_d_266600170_d_561681068,
			d_173836415_d_266600170_d_847159717,
			d_173836415_d_266600170_d_448660695,
			d_173836415_d_266600170_d_139245758,
			d_173836415_d_266600170_d_541311218,
			d_173836415_d_266600170_d_740582332,
			d_173836415_d_266600170_d_982213346,
			d_173836415_d_266600170_d_398645039,
			d_173836415_d_266600170_d_822274939,
			d_173836415_d_266600170_d_769615780,
			d_173836415_d_266600170_d_224596428,
			d_173836415_d_266600170_d_939818935,
			d_914594314,
			d_821247024,
			d_827220437,
			d_512820379,
			state_d_158291096,
			d_471593703,
			d_117249500,
			d_564964481,
			d_544150384,
			d_430551721,
			state_d_934298480,
			d_230663853,
			d_335767902,
			d_982402227,
			d_919254129,
			d_699625233,
			d_795827569,
			DATE_DIFF(
				CAST(SUBSTR(d_205553981, 1, 10) AS DATE),
				PARSE_DATE('%Y%m%d', CAST(d_371067537 AS STRING)),
				DAY
			) / 365 AS age
		FROM
			`nih-nci-dceg-connect-prod-6d04.FlatConnect.participants_JP`
		WHERE
			d_821247024 = '197316935' -- Include Only Verified Participants
	) -- [2] Select specific attributes and categorize age
SELECT -- List raw variables here
	Connect_ID,
	d_100767870,
	d_949302066,
	d_536735468,
	d_663265240,
	d_976570371,
	d_517311251,
	d_832139544,
	d_264644252,
	d_770257102,
	d_684635302,
	d_878865966,
	d_167958071,
	d_173836415_d_266600170_d_915179629,
	d_173836415_d_266600170_d_718172863,
	d_173836415_d_266600170_d_592099155,
	d_173836415_d_266600170_d_561681068,
	d_173836415_d_266600170_d_847159717,
	d_173836415_d_266600170_d_448660695,
	d_173836415_d_266600170_d_541311218,
	d_173836415_d_266600170_d_740582332,
	d_173836415_d_266600170_d_982213346,
	d_173836415_d_266600170_d_398645039,
	d_173836415_d_266600170_d_822274939,
	d_173836415_d_266600170_d_769615780,
	d_173836415_d_266600170_d_139245758,
	d_173836415_d_266600170_d_224596428,
	d_173836415_d_266600170_d_939818935,
	d_914594314,
	d_821247024,
	d_827220437,
	d_512820379,
	state_d_158291096,
	d_471593703,
	d_117249500,
	d_564964481,
	d_544150384,
	d_430551721,
	state_d_934298480,
	d_230663853,
	d_335767902,
	d_982402227,
	d_919254129,
	d_699625233,
	d_795827569,
	-- Add derived or binned variables here
	-- We need to tripple check that these make sense! But I rearranged them in an intuitive order
	CASE
		WHEN age >= 66
		AND age < 71 THEN '66-70'
		WHEN age >= 61
		AND age < 66 THEN '61-65'
		WHEN age >= 56
		AND age < 61 THEN '56-60'
		WHEN age >= 51
		AND age < 56 THEN '51-55'
		WHEN age >= 46
		AND age < 51 THEN '46-50'
		WHEN age >= 40
		AND age < 46 THEN '40-45'
		ELSE 'UNKNOWN'
	END AS AgeUP_cat
FROM
	Participants
;