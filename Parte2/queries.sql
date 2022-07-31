# --------------------------------------------------
# 1

SELECT 
	table1.NOMBRE_AEROPUERTO, table2.total_movimientos
FROM 
	aeropuertos AS table1
INNER JOIN
	(SELECT
		ID_AEROPUERTO,
		COUNT(*) AS total_movimientos
	FROM
		vuelos
	GROUP BY 
		ID_AEROPUERTO
	ORDER BY total_movimientos) AS table2
ON table1.ID_AEROPUERTO = table2.ID_AEROPUERTO
ORDER BY total_movimientos DESC LIMIT 2;

# --------------------------------------------------
# 2

SELECT 
	table1.NOMBRE_AEROLINEA, table2.total_vuelos
FROM 
	aerolineas AS table1
INNER JOIN
	(SELECT
		ID_AEROLINEA,
		COUNT(*) AS total_vuelos
	FROM
		vuelos
	GROUP BY 
		ID_AEROLINEA
	ORDER BY total_vuelos) AS table2
ON table1.ID_AEROLINEA = table2.ID_AEROLINEA
ORDER BY total_vuelos DESC
LIMIT 2;
# --------------------------------------------------
# 3

SELECT 
	DIA, 
	COUNT(*) AS total  
FROM vuelos 
GROUP BY DIA
ORDER BY total DESC
LIMIT 1;

# --------------------------------------------------
# 4

SELECT 
	table2.DIA, 
	table1.NOMBRE_AEROLINEA, 
	table2.total
FROM 
	aerolineas AS table1
INNER JOIN
	(SELECT 
		DIA,
		ID_AEROLINEA,
		COUNT(*) AS total
	FROM
		vuelos
	GROUP BY
		DIA,
		ID_AEROLINEA
	ORDER BY
		total) as table2
ON table1.ID_AEROLINEA = table2.ID_AEROLINEA
ORDER BY total DESC;









