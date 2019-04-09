--SELECT MonthYear
--	, DATEADD(d,-day(EvaluationDateTime)+1, CAST(EvaluationDateTime AS DATE)) AS MonthStart
--	, CASE WHEN PolicyResult IN ('Fail') THEN 1 ELSE 0 end AS FailedPolicyCount
--FROM policy.v_PolicyHistory
USE [DBNAME]
SELECT count(*)
FROM policy.v_PolicyHistory_LastEvaluation iple

SELECT iple.EvaluatedPolicy, count(*)
FROM policy.v_PolicyHistory_LastEvaluation iple
WHERE 
		--iple.CategoryName IN ('Microsoft Best Practices: Database Design','Microsoft Best Practices: Version Audit','Microsoft Best Practices: Performance','Microsoft Off by Default: Surface Area Configuration','Microsoft Best Practices: Security','Microsoft Best Practices: Audit','Microsoft Best Practices: Database Configurations','Microsoft Best Practices: Maintenance','Microsoft Best Practices: Server Configuration') 
		 iple.PolicyResult = 'FAIL' or iple.PolicyResult = 'ERROR'
group by iple.EvaluatedPolicy
order by 2