 
 	SELECT CASE 
	WHEN EXISTS 
		(SELECT * FROM( SELECT COUNT(*) as FailCount FROM policy.v_PolicyHistory_LastEvaluation iple 
		WHERE iple.EvaluatedServer = ple.EvaluatedServer COLLATE DATABASE_DEFAULT
		AND iple.CategoryName IN (SELECT DISTINCT CategoryName FROM policy.v_PolicyHistory)
		AND iple.EvaluatedPolicy IN (SELECT DISTINCT EvaluatedPolicy FROM policy.v_PolicyHistory WHERE CategoryName IN (SELECT DISTINCT CategoryName FROM policy.v_PolicyHistory))
		AND iple.PolicyResult = 'FAIL') q WHERE q.FailCount>5 )
	THEN 'Out of Compliance'
	WHEN EXISTS 
		(SELECT * 
		FROM policy.v_PolicyHistory_LastEvaluation iple 
		WHERE iple.EvaluatedServer = ple.EvaluatedServer COLLATE DATABASE_DEFAULT
		AND iple.CategoryName IN (SELECT DISTINCT CategoryName
FROM policy.v_PolicyHistory)
		AND iple.EvaluatedPolicy   IN (SELECT DISTINCT EvaluatedPolicy
FROM policy.v_PolicyHistory
WHERE CategoryName IN (SELECT DISTINCT CategoryName
FROM policy.v_PolicyHistory))
		AND iple.PolicyResult = 'ERROR')
	THEN 'Unknown'
	ELSE 'In Compliance' 
	END AS InstanceStatus
	, EvaluatedServer
FROM policy.v_PolicyHistory ple
--WHERE (EvaluatedServer COLLATE DATABASE_DEFAULT IN (SELECT server_name FROM policy.pfn_ServerGroupInstances(@ServerGroupName))
--	OR @ServerGroupName = '')
GROUP BY EvaluatedServer  


--SELECT server_name FROM policy.pfn_ServerGroupInstances('POZITIF')

--SELECT GroupName, GroupValue
--FROM policy.v_ServerGroups
--ORDER BY Sort