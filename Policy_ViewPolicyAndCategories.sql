SELECT [policy_id]
      , b.name 
      , a.[name] 
      , [date_created] 
      , [description]
      , [help_text] 
      , [is_enabled]
      , [job_id]
      , [created_by]
      , [modified_by]
      , [date_modified]
      , [is_system]
      , *
FROM [msdb].[dbo].[syspolicy_policies] a
    left join [msdb].[dbo].[syspolicy_policy_categories] b
    on a.policy_category_id=b.policy_category_id
WHERE b.name<>'DISABLED'
order by b.name