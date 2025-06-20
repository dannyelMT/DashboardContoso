WITH TableAgregaçãoVendas AS (
SELECT
	DateKey,
	ChannelName,
	ProductCategoryName,
	DP.UnitPrice,
	SalesQuantity,
	(SalesQuantity * DP.UnitPrice) AS 'Valor_Venda'
FROM
	factSales FC
INNER JOIN DimChannel DC ON FC.channelKey = DC.ChannelKey
INNER JOIN DimProduct DP ON FC.ProductKey = DP.ProductKey
	INNER JOIN DimProductSubcategory  DPS ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
		INNER JOIN DimProductCategory DPC ON DPS.ProductCategoryKey = DPC.ProductCategoryKey
WHERE ChannelName NOT IN ('Catalog') AND YEAR(dateKey) = 2009
)

SELECT
	ProductCategoryName,
	FORMAT(ROUND(SUM(Valor_Venda), 0), '#,0') AS 'Total de vendas'
FROM
	TableAgregaçãoVendas
GROUP BY ProductCategoryName
ORDER BY ROUND(SUM(Valor_Venda), 0) DESC