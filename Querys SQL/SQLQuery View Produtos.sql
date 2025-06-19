CREATE OR ALTER VIEW Vw_Produtos AS
	SELECT
		ProductKey,
		ProductName,
		ProductCategoryName,
		ProductSubcategoryName,
		BrandName,
		ClassNAme,
		ColorName,
		UnitCost,
		UnitPrice
	FROM DimProduct as P
	INNER JOIN DimProductSubcategory as PS
		on P.ProductSubcategoryKey = PS.ProductSubcategoryKey
			INNER JOIN DimProductCategory as PC
				ON PS.ProductCategoryKey = PC.ProductCategoryKey