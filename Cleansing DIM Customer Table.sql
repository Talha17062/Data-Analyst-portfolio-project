-- Cleansing DIM Customer Table 
SELECT 
  c.[CustomerKey] AS customerkey
  --,[GeographyKey] 
  --,[CustomerAlternateKey]
  -- ,[Title]
  ,c.FirstName AS firstname 
  --,MiddleName
  ,c.LastName AS lastname 
  ,c.FirstName + ' ' + c.LastName AS fullname 
  --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  ,CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS gender 
  /* ,[EmailAddress]
        ,[YearlyIncome]
        ,[TotalChildren]
        ,[NumberChildrenAtHome]
        ,[EnglishEducation]
        ,[SpanishEducation]
        ,[FrenchEducation]
        ,[EnglishOccupation]
        ,[SpanishOccupation]
        ,[FrenchOccupation]
        ,[HouseOwnerFlag]
        ,[NumberCarsOwned]
        ,[AddressLine1]
        ,[AddressLine2]
        ,[Phone] */
  ,c.DateFirstPurchase AS Firstpurchasingdate
  --,[CommuteDistance]
  ,g.City AS customercity 
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimGeography] AS g ON c.GeographyKey = g.GeographyKey 
ORDER BY 
  c.CustomerKey ASC
