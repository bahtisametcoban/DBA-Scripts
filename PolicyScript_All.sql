--Policy Properties

USE msdb;
GO
SELECT name,
  execution_mode,
  description,
  is_enabled,
  job_id
FROM syspolicy_policies;
GO


--Condition Properties

USE msdb;
GO
SELECT name,
  description,
  facet,
  expression,
  is_name_condition,
  obj_name
FROM syspolicy_conditions;
GO

--List Policy Categories
SELECT *
from syspolicy_policy_categories


--Delete a Catogry

EXEC msdb.dbo.sp_syspolicy_delete_policy_category @name = N'Finance';

--Add a category

DECLARE @policy_category_id int;

EXEC msdb.dbo.sp_syspolicy_add_policy_category  
  @name = N'Microsoft Best Practices: Backups'  
, @mandate_database_subscriptions = 0  
, @policy_category_id = @policy_category_id OUTPUT;  

GO 