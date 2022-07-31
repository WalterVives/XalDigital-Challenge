# XalDigital
## Prueba técnica parte 2

Se tienen las siguientes tablas que contienen información referente hacia los vuelos que se realizan en México:

*Tabla de aerolíneas*

|ID_AEROLINEA|NOMBRE_AEROLINEA|
|:---|:------------|
|  1 |Volaris      | 
|  2 |Aeromar      |
|  3 |Interjet     |
|  4 |Aeromexico   |

*Tabla de aeropuertos*

|  ID_AEROPUERTO |  NOMBRE_AEROPUERTO|
|----------------|-------------------|
|  1             |Benito Juarez      |
|  2             |Guanajuato         |
|  3             |La paz             |
|  4             |Oaxaca             |


*Tabla de movimientos*

|ID_MOVIMIENTO|DESCRIPCION|
|-------------|-----------|
|1            |Salida     |
|2            |Llegada    |

*Tabla de vuelos*

|ID_AEROLINEA|ID_AEROPUERTO|ID_MOVIMIENTO|DIA|
|---|---|---|----|
|1|1|1|2021-05-02|
|2|1|1|2021-05-02|
|3|2|2|2021-05-02|
|4|3|2|2021-05-02|
|1|3|2|2021-05-02|
|2|1|1|2021-05-02|
|2|3|1|2021-05-04|
|3|4|1|2021-05-04|
|3|4|1|2021-05-04|


### Inicializamos MySQL:

![MySQl_start](terminal_ss/01.png)

**Tablas:**

- aerolineas
- aeropuertos
- vuelos

### Preguntas

- ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?

![MySQl_start](terminal_ss/05.png)

Como podemos observar hay dos valores que son el máximo, por lo cuál en la query final se debe tomar en cuenta:

``` sql
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
ORDER BY total_movimientos DESC 
LIMIT 2;
```
![MySQl_start](terminal_ss/06.png)

**Respuesta:** El nombre de los aeropuertos que ha tenido mayor movimiento durante el año son: **Benito Juarez** & **La Paz**.

-  ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante
el año?

Igual en este caso hay dos aeropuertos con igual número máximo

```sql
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
```
![MySQl_start](terminal_ss/07.png)

**Respuesta:** El nombre de las aerolíneas que ha realizado mayor número de vuelos durante el año son: **Aeromar** & **Interjet**.

- ¿En qué día se han tenido mayor número de vuelos?

![MySQl_start](terminal_ss/08.png)

```sql
SELECT 
	DIA, 
	COUNT(*) AS total  
FROM vuelos 
GROUP BY DIA
ORDER BY total DESC
LIMIT 1;
```
**Respuesta:** En el día **'2021-05-02'** se ha tenido el mayor número de vuelos con un total de **6**.

- ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?

![MySQl_start](terminal_ss/09.png)

```sql
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
```
**Respuesta:** **Ninguna** aerolínea que tiene más de 2 vuelos por día.



