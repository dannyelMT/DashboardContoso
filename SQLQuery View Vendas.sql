
CREATE VIEW Vw_Vendas AS 
SELECT
	FORMAT(DateKey, 'yyyy-MM') AS 'AnoMes',
	ChannelName,
	GeographyKey,
	ProductKey,
	Sum(SalesQuantity) AS 'Qtde vendas'
FROM
	FactSales AS FC
INNER JOIN DimChannel AS DC ON FC.channelKey = DC.ChannelKey
INNER JOIN DimStore AS DS ON FC.StoreKey = DS.StoreKey
GROUP BY FORMAT(DateKey, 'yyyy-MM'),
		ChannelName,
		GeographyKey,
		ProductKey
