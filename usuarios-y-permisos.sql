-- 1) Crear un usuario llamado userdam con contraseña ‘admin’.

CREATE USER 'userdam'@'localhost' IDENTIFIED BY 'admin';

-- 2) Acceder desde su cuenta y ver qué pasa.

-- Hecho

-- 3) Le otorgamos TODOS los permisos SOLAMENTE en la base de datos librería.3) Le otorgamos TODOS los permisos SOLAMENTE en la base de datos librería.

GRANT ALL PRIVILEGES ON *.* TO 'userdam'@'localhost';

-- 4) Le otorgamos permisos de CONSULTA, INSERCIÓN Y MODIFICACIÓN a la tabla PERSONA de la base de datos UNIVERSIDAD.

GRANT SELECT, INSERT, UPDATE ON universidad.persona TO 'userdam'@'localhost';

-- 5) Le otorgamos todos los privilegios en la base de datos de jardinería de tal manera que
-- userdam pueda otorgar los mismos privilegios a otros usuarios.

GRANT ALL PRIVILEGES ON jardineria.* TO 'userdam'@'localhost' WITH GRANT OPTION;

-- 6) Quitarle todos los permisos a ese usuario.

REVOKE ALL PRIVILEGES ON *.* FROM 'userdam'@'localhost';

-- 7) Comprobar si se ha efectuado el cambio accediendo desde su cuenta.

-- Comprobado

-- 8) Creamos dos roles: administrador, usuario para administrar la base de datos EMPLEADOS.
-- 	 Usuario: Tendrá los privilegios de consultar
-- 	 Administrador: Tendrá todos los privilegios.

CREATE ROLE IF NOT EXISTS 'administrador', 'usuario';
GRANT SELECT ON empleados.* TO 'usuario';
GRANT ALL ON *.* TO 'administrador';

-- 9) Otorgamos el rol usuario a nuestro userdam

GRANT 'usuario' TO 'userdam'@'localhost';

-- 10) Comprobamos que puede acceder a la info de esa base de datos.

SHOW GRANTS FOR 'userdam'@'localhost';

-- 11) Le quitamos el rol al usuario.

REVOKE 'usuario' FROM 'userdam'@'localhost';

-- 12) Borramos el rol.

DROP ROLE 'usuario';

-- 13) Borramos el usuario.

DROP USER 'userdam'@'localhost';