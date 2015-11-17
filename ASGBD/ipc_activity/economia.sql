/* Ejercicio 3. Crear a un usuario, montoro, que tenga todos los privilegios y
pueda acceder desde localhost con password. */
GRANT ALL
    ON `economia`.* TO
        `montoro`@`127.0.0.1` IDENTIFIED BY 'ausias',
        `montoro`@`localhost` IDENTIFIED BY 'ausias';

/* Ejercicio 4. Crear la tabla provincias. ¿Cuál es la clave principal? Crear
una provincia que se llame Nacional. ¿De qué tipo es el campo clave? Revisa que
no haya ninguna fila vacía. */
DROP TABLE IF EXISTS `Provincias`;

CREATE TABLE IF NOT EXISTS `Provincias`
AS (
    SELECT DISTINCT
        SUBSTRING(t.`Provincias`,1,2) "id",
        SUBSTRING(t.`Provincias` FROM 4) "nombre"
    FROM `Temporal` t
);

ALTER TABLE `Provincias`
    ADD PRIMARY KEY (`id`);

/* Ejercicio 5. Crear la tabla sectores ¿Cómo creamos la clave principal?*/
DROP TABLE IF EXISTS `Sectores`;

CREATE TABLE IF NOT EXISTS `Sectores` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    PRIMARY KEY ( `id` )
);

INSERT INTO `Sectores` (`nombre`)
    SELECT DISTINCT t.`Sectores`
    FROM `Temporal` t;

/* Ejercicio 7. Crear la tabla autonomías. */
CREATE TABLE IF NOT EXISTS `Autonomias` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    `iso3166-2-es` VARCHAR(5) NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `Autonomias` (`nombre`, `iso3166-2-es`)
VALUES
    ('Andalucía','ES-AN'),
    ('Aragón','ES-AR'),
    ('Asturias, Principado de','ES-AS'),
    ('Canarias','ES-CN'),
    ('Cantabrias', 'ES-CB'),
    ('Castilla-La Mancha', 'ES-CM'),
    ('Castilla y León', 'ES-CL'),
    ('Cataluña', 'ES-CT'),
    ('Extremadura', 'ES-EX'),
    ('Galicia', 'ES-GA'),
    ('Islas Baleares', 'ES-IB'),
    ('La Rioja', 'ES-RI'),
    ('Madrid, Comunidad de', 'ES-MD'),
    ('Murcia, Región de', 'ES-MC'),
    ('Navarra, Comunidad Foral de', 'ES-NC'),
    ('País Vasco', 'ES-PV'),
    ('Valenciana, Comunidad', 'ES-VC'),
    ('Ceuta','ES-CE'),
    ('Melilla','ES-ML');

/* Ejercicio 8. Modificar la tabla provincias para incluir la pertenencia a
alguna autonomía. */
ALTER TABLE `Provincias`
    ADD `autonomia` INT NULL;

UPDATE `Provincias`
    SET `autonomia`='1'
    WHERE `nombre` IN ('04','11','14','18','21','23','29','41');

UPDATE `Provincias`
    SET `autonomia`='2'
    WHERE `nombre` IN ('22','44','50');

UPDATE `Provincias`
    SET `autonomia`='3'
    WHERE `nombre` IN ('33');

UPDATE `Provincias`
    SET `autonomia`='4'
    WHERE `nombre` IN ('35','38');

UPDATE `Provincias`
    SET `autonomia`='5'
    WHERE `nombre` IN ('39');

UPDATE `Provincias`
    SET `autonomia`='6'
    WHERE `nombre` IN ('02','13','16','19','45');

UPDATE `Provincias`
    SET `autonomia`='7'
    WHERE `nombre` IN ('05','09','24','34','37','40','42','47','49');

UPDATE `Provincias`
    SET `autonomia`='8'
    WHERE `nombre` IN ('08','17','25','43');

UPDATE `Provincias`
    SET `autonomia`='9'
    WHERE `nombre` IN ('06','10');

UPDATE `Provincias`
    SET `autonomia`='10'
    WHERE `nombre` IN ('15','27','32','36');

UPDATE `Provincias`
    SET `autonomia`='11'
    WHERE `nombre` IN ('07');

UPDATE `Provincias`
    SET `autonomia`='12'
    WHERE `nombre` IN ('26');

UPDATE `Provincias`
    SET `autonomia`='13'
    WHERE `nombre` IN ('28');

UPDATE `Provincias`
    SET `autonomia`='14'
    WHERE `nombre` IN ('30');

UPDATE `Provincias`
    SET `autonomia`='15'
    WHERE `nombre` IN ('31');

UPDATE `Provincias`
    SET `autonomia`='16'
    WHERE `nombre` IN ('01','20','48');

UPDATE `Provincias`
    SET `autonomia`='17'
    WHERE `nombre` IN ('03','12','46');

UPDATE `Provincias`
    SET `autonomia`='18'
    WHERE `nombre` IN ('51');

UPDATE `Provincias`
    SET `autonomia`='19'
    WHERE `nombre` IN ('52');

/* Ejercicio 9. Crear las claves ajenas. ¿Que hacemos con la provincia
nacional? */
ALTER TABLE `Provincias` ADD
    CONSTRAINT `fk_provincia_autonomias`
    FOREIGN KEY (`autonomia`)
    REFERENCES `Autonomias` (`id`);

ALTER TABLE `var_ipc_mes`
    ADD CONSTRAINT `fk_varipcmes_provincia`
        FOREIGN KEY (`provincia`)
        REFERENCES `Provincias` (`id`),
    ADD CONSTRAINT `fk_varipcmes_sectores`
        FOREIGN KEY (`sector`)
        REFERENCES `Sectores` (`id`);

/* Ejercicio 10. Crear un vista, ipc_acumulado, que muestre cuanto ha variado
el IPC el año actual por provincias. */
CREATE VIEW `ipc_acumulado` AS
    SELECT p.`nombre` AS "Provincia", vim.`valor` AS "Variación de IPC"
        FROM `Provincias` p, `var_ipc_mes` vim
        WHERE p.`id` = vim.`provincia`
            AND vim.`anyo` = '2015'
        GROUP BY 1;

/* Ejercicio 11. Crear una vista, ipc_interanual, que muestre cuanto ha variado
el IPC en los 12 últimos meses por provincias. */
CREATE VIEW `ipc_interanual` AS
SELECT p.`nombre` AS "Provincia", vim.`valor` AS "Variación de IPC"
    FROM `Provincias` p, `var_ipc_mes` vim
    WHERE p.`id` = vim.`provincia`
        AND (
            vim.`anyo` = '2015'
            OR (vim.`anyo` = '2014'
                AND vim.`mes`>='10'
            )
        )
    GROUP BY 1;

/* Ejercicio 12. Crear un usuario que tenga acceso sólo a estas dos vistas. */
GRANT ALL
    ON `economia`.`ipc_acumulado` TO
        `fernandez`@`127.0.0.1` IDENTIFIED BY 'ausias',
        `fernandez`@`localhost` IDENTIFIED BY 'ausias';

GRANT ALL
    ON `economia`.`ipc_acumulado` TO
        `fernandez`@`127.0.0.1`,
        `fernandez`@`localhost`;

/* Ejercicio 13.Crear un vista, ipc_acumulado_ca, que muestre cuanto ha variado
el IPC el año actual por autonomías. Usamos una media aritmética. */
CREATE VIEW `ipc_acumulado_ca` AS
    SELECT a.`nombre` AS "Autonomía", ROUND(AVG(vim.`valor`),3) AS "Var. aritm. de IPC"
        FROM `Autonomias` a, `Provincias` p,`var_ipc_mes` vim
        WHERE a.`id` = p.`autonomia`
            AND p.`id` = vim.`provincia`
            AND vim.`anyo` = '2015'
        GROUP BY 1;

/* Ejercicio 14. Crear una vista, ipc_interanual_ca, que muestre cuanto ha
variado el IPC en los 12 últimos meses por autonomías. */
CREATE VIEW `ipc_interanual_ca` AS
    SELECT a.`nombre` AS "Autonomía", ROUND(AVG(vim.`valor`),3) AS "Var. aritm. de IPC"
        FROM `Autonomias` a, `Provincias` p, `var_ipc_mes` vim
        WHERE a.`id` = p.`autonomia`
            AND p.`id` = vim.`provincia`
            AND (
                vim.`anyo` = '2015'
                OR (
                    vim.`anyo` = '2014'
                    AND vim.`mes`>='10'
                )
            )
        GROUP BY 1;

/* Ejercicio 15. Crear un usuario que tenga acceso sólo a estas dos vistas. */
GRANT ALL
    ON `economia`.`ipc_acumulado_ca` TO
        `mercedes`@`127.0.0.1` IDENTIFIED BY 'ausias',
        `mercedes`@`localhost` IDENTIFIED BY 'ausias';

GRANT ALL
    ON `economia`.`ipc_interanual_ca` TO
        `mercedes`@`127.0.0.1`,
        `mercedes`@`localhost`;

