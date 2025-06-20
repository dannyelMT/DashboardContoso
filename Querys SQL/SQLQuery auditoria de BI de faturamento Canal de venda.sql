WITH TableVendas AS (
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
), TableVendasAgrega��o AS(
SELECT
	ChannelName,
	SUM(Valor_Venda) AS 'Faturamento'

FROM TableVendas
GROUP BY ChannelName
)

SELECT
	ChannelName,
	FORMAT(Faturamento, '#,0') AS 'Faturamento',
	FORMAT(Faturamento / SUM(Faturamento) OVER(), '0.00%') AS 'Perc %'
FROM TableVendasAgrega��o