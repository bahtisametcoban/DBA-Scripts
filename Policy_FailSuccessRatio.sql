----Total policy success/fail counts
SELECT [PolicyResult]
      , COUNT(*)
FROM [PBM].[policy].[v_PolicyHistory_LastEvaluation]
GROUP BY [PolicyResult]

--Failed policy count per category
SELECT count(*), [EvaluatedPolicy], *
FROM [PBM].[policy].[v_PolicyHistory_LastEvaluation]
WHERE PolicyResult='FAIL'
GROUP BY [EvaluatedPolicy]
ORDER BY 1 DESC

----Failed servers
SELECT [EvaluatedServer]
     , COUNT(*)
FROM [PBM].[policy].[v_PolicyHistory_LastEvaluation]
WHERE PolicyResult='FAIL'
GROUP BY  [EvaluatedServer]
ORDER BY 2 DESC

--Get all last failed policies
SELECT [EvaluatedServer]
      , [EvaluationDateTime]
      , [EvaluatedPolicy]
      , [EvaluatedObject]
      , [PolicyResult] 
      , [ExceptionMessage] 
      , [CategoryName]
FROM [PBM].[policy].[v_PolicyHistory_LastEvaluation]
WHERE PolicyResult='FAIL'
  --AND EvaluatedPolicy='OLA_UserDBDiffBackup Check'
  AND EvaluatedPolicy='Compatibility Level is Optimal'
