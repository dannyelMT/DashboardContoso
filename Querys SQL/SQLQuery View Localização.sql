
CREATE VIEW Vw_Localiza��o AS
SELECT
	GeographyKey,
	GeographyType,
	ContinentName,
	CityName,
	StateProvinceName,
	RegionCountryName
FROM
	DimGeography