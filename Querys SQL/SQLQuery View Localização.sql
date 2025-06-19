
CREATE VIEW Vw_Localização AS
SELECT
	GeographyKey,
	GeographyType,
	ContinentName,
	CityName,
	StateProvinceName,
	RegionCountryName
FROM
	DimGeography