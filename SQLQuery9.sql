
SELECT (SUM(FactSales.SalesAmount) - SUM(FactSales.ReturnAmount) -SUM(FactSales.DiscountAmount)) AS 'Net Revenue'
, SUM(FactSales.SalesQuantity) - SUM(FactSales.ReturnQuantity) AS 'NetSalesQuantity'
,DimProductCategory.ProductCategoryKey AS 'CategoryKey'
, DimProductCategory.ProductCategoryName AS 'CategoryName'
, DimProduct.ProductName AS 'ProductName'
FROM DimStore AS DimStore_1 INNER JOIN
                         DimGeography AS DimGeography_1 ON DimStore_1.GeographyKey = DimGeography_1.GeographyKey INNER JOIN
                         FactSales ON DimStore_1.StoreKey = FactSales.StoreKey INNER JOIN
                         DimProductSubcategory INNER JOIN
                         DimProduct ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey INNER JOIN
                         DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey ON 
                         FactSales.ProductKey = DimProduct.ProductKey
WHERE     (DimGeography_1.RegionCountryName = N'United States')
GROUP BY DimProduct.ProductName, DimProductCategory.ProductCategoryName,DimProductCategory.ProductCategoryKey
ORDER BY 'CategoryKey' --'Net Revenue' DESC,'NetSalesQuantity' DESC
