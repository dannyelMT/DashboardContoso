
CREATE VIEW Vw_Lojas AS
SELECT
	StoreKey,
	GeographyKey,
	StoreType,
	StoreName,
	Status
FROM
	DimStore

