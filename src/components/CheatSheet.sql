-- inicio de mysql
mysql -u usuario -p

-- seleccionar la base de datos
use <nombre_base_datos>

-- para no guardar errores
\c 
or
[ctrl] + C

-- para limpiar todo en consola
[ctrl] + L

-- crear una tabla
create table mascotas (
    -> id mediumint not null auto_increment,
    -> tipo enum('pez','mamifero','ave') not null,
    -> nombre char(30) not null,
    -> primary key(id)
    -> ) engine=InnoDB charset=utf8 collate=utf8_general_ci;

-- insertar datos en una tabla
insert into mascotas (tipo, nombre) values
    -> ('mamifero','perro'),
    -> ('mamifero','gato'),
    -> ('ave','loro'),
    -> ('pez','goldfish'),
    -> ('mamifero','ardilla'),
    -> ('ave','canario');

-- mostrar los datos de una tabla
select * from mascotas

-- mostrar datos de una tabla ordenados por columnas
select * from mascotas order by tipo, id;

-- describir la estructura de una tabla
describe mascotas;

-- obtener el script de creación de una tabla
show create table mascotas;

-- crear copia de seguridad (dump) en un archivo
mysqldump -u usuario -p clinica_veterinaria mascotas > mascotas.sql

-- restaurar copia de seguridad desde la consola de linux
mysql -u usuario -p clinica_veterinaria < mascotas.sql

-- eliminar tabla
drop table mascotas;

-- restaurar copia de seguridad desde CLI de MySQL
source mascotas.sql;

-- añadir columna a una tabla ya creada
 alter table mascotas add column edad smallint not null default 0;

-- eliminar columnas
alter table mascotas drop column edad;

--añadir columna a una tabla ya creada en una posición específica
alter table mascotas add column edad smallint not null default 0 after tipo;

--añadir columna a una tabla ya creada en la primera posición
alter table mascotas add column edad smallint not null default 0 first;

--mover columna ya creada en una tabla
alter table mascotas change edad edad smallint not null default 0 after nombre;
alter table mascotas change edad edad smallint not null default 0 after tipo;

--mover columna ya creada en una tabla renombrandola
alter table mascotas change edad age smallint not null default 0 after id;

-- renombrar tabla
rename table mascotas to pets;
alter table pets rename especies;

-- crear índice de una tabla
alter table especies add index tipo_edad (tipo, edad);

-- renombrar columna
alter table especies change id id_mascota mediumint not null auto_increment;

-- cambiar primary key (después de eliminar autoincrement)
(alter table especies change id_mascota id_mascota mediumint not null;)
alter table especies drop primary key, add primary key (nombre);

--