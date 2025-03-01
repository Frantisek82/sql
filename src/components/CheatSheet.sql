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

-- eliminar todas las filas de la tabla existente
truncate mascotas;

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

-- cambiar char(30) a char(255) para nombre en la tabla
alter table mascotas change nombre nombre char(255) not null;

-- obtener info from the tabla
select tipo, nombre, edad from mascotas where tipo = "mamifero" order by edad
desc;
select count(*) from mascotas where tipo = "mamifero";
select tipo, edad from mascotas where tipo != "mamifero" and edad > 20 order by edad asc;

-- select avarage age of "ave" from mascotas
select avg(edad) from mascotas where tipo like "ave";

-- round selected number of the result
select round(avg(edad)) from mascotas where tipo like "ave";

-- display name and age of particular name from the table
select nombre, edad from mascotas where nombre = "Orca";

-- change age of the particular name
update mascotas set edad = 3 where nombre = "Orca";

-- elimina los registros de una tabla sin eliminar los espacios asignados
delete from mascotas where edad > 50;

-- convert entire MySQL database character-set to UTF-8 and collation to UTF-8
alter table propietarios_mascotas engine=InnoDB charset=utf8 collate=utf8_gener
al_ci;

-- Crear la tabla propietarios_mascotas con las columnas propietario_id y mascota_id donde ambas columnas serán claves foráneas y la clave primaria, estará formada por ambas columnas (todos tienen que tener minimo una mascota)

create table propietarios_mascotas (
    propietario_id mediumint not null,
    mascota_id mediumint not null,
    primary key (propietario_id, mascota_id),
    foreign key (propietario_id) references propietarios (id),
    foreign key (mascota_id) references mascotas (id)
    on delete cascade on update cascade
);

-- Crar la tabla books in database library

CREATE TABLE Library.books (
     id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT, 
     title VARCHAR(255) NOT NULL, 
     price DOUBLE NOT NULL, 
     publisher VARCHAR(255) NOT NULL, 
     pages SMALLINT NOT NULL, 
     author VARCHAR(255) NOT NULL, 
     PRIMARY KEY (id)
);

CREATE TABLE 
    books (
        id mediumint, 
        title varchar(255), 
        price double, 
        publisher varchar(255), 
        pages smallint, 
        author varchar(255), 
    );