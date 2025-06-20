WITH TableAgregaçãoVendas AS (
SELECT
	DateKey,
	ChannelName,
	DP.UnitPrice,
	SalesQuantity,
	(SalesQuantity * DP.UnitPrice) AS 'Valor_Venda'
FROM
	factSales FC
INNER JOIN DimChannel DC ON FC.channelKey = DC.ChannelKey
INNER JOIN DimProduct DP ON FC.ProductKey = DP.ProductKey
WHERE ChannelName NOT IN ('Catalog') AND YEAR(dateKey) = 2009
)

SELECT
	FORMAT(ROUND(SUM(Valor_Venda), 0), '#,0') AS 'Total de vendas'
FROM 
	TableAgregaçãoVendas