 -- Cleansing and transforming the Dim Product Table 
 SELECT 
       p.[ProductKey]
      ,p.[ProductAlternateKey] AS product_item_code
    --,[ProductSubcategoryKey]
    --,[WeightUnitMeasureCode]
    --,[SizeUnitMeasureCode]
      ,p.[EnglishProductName] AS product_name
	  ,ps.[EnglishProductSubcategoryName] AS product_subcategory_name -- This attribute will come from the table (DimProductSubcategory) we just joined
	  ,pc.[EnglishProductCategoryName] AS product_category_name -- This attribute will come from the table (DimProductCategory) we just joined
    --,[SpanishProductName]
    --,[FrenchProductName]
    --,[StandardCost]
    --,[FinishedGoodsFlag]
      ,p.[Color] AS product_color
    --,[SafetyStockLevel]
    --,[ReorderPoint]
    --,[ListPrice]
      ,p.[Size] AS product_size
      /*,[SizeRange]
      ,[Weight]
      ,[DaysToManufacture] */
      ,p.[ProductLine] AS product_line
    --,[DealerPrice]
    --,[Class]
    --,[Style]
      ,p.[ModelName] AS product_model_name
    --,[LargePhoto]
      ,p.[EnglishDescription] AS product_discription
      /*,[FrenchDescription]
      ,[ChineseDescription]
      ,[ArabicDescription]
      ,[HebrewDescription]
      ,[ThaiDescription]
      ,[GermanDescription]
      ,[JapaneseDescription]
      ,[TurkishDescription]
      ,[StartDate]
      ,[EndDate]  */
      , ISNULL (p.Status, 'Outdated') AS product_status
  FROM [AdventureWorksDW2019].[dbo].[DimProduct] AS p 
  LEFT JOIN [AdventureWorksDW2019].[dbo].DimProductSubcategory AS ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
  LEFT JOIN [AdventureWorksDW2019].[dbo].DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
