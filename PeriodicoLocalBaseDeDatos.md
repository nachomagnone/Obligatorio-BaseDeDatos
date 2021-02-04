# Obligatorio-BaseDeDatos
DESCRIPCIÓN DE LA REALIDAD:
Se requiere de un sistema que permita gestionar los avisos clasificados (comunes o destacados), de un
periódico local; además de los artículos que se ofrecen.
Los avisos clasificados serán publicados dentro de una determinada categoría, de la cual se sabe un
código interno de 3 letras, el nombre de la categoría y el precio base de la publicación dentro de la
categoría.
De los avisos clasificados se conoce un número interno (que se genera automáticamente en la base de
datos), un grupo de teléfonos de contacto, y la fecha de publicación del mismo. Existen dos tipos de
avisos clasificados: los comunes, de los que se conocen un grupo de palabras claves; y los destacados,
de los que se sabe el articulo ofrecido (únicamente uno por cada aviso).
De cada artículo, se sabe un código alfanumérico de 6 caracteres, el precio del artículo y una breve
descripción del mismo.

REQUERIMIENTO DEL SISTEMA
1) Crear el MER (incluyendo RNE) que modele la realidad anterior.
2) Crear el Modelo Relacional, determinando las tablas, los atributos y las claves; en caso que alguna
relación se optimice, indicarlo.
3) Implementar el modelo en un script de SQL Server 2008, en lenguaje T-SQL, con la creación
completa de la base de datos e inserción de registros de prueba.
4) Implementar los siguientes procedimientos almacenados (codificarlos al final del archivo
Obligatorio.sql), generando el código necesario para probarlos:
A. Eliminar Avisos.
B. Agregar Aviso Clasificado Destacado
C. Total Avisos Por categoría
D. Total Avisos Periodo
E. MontoACobrar
