USE metro_cdmx;


CREATE TABLE `drivers` (

    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20),
    `status` BOOLEAN NOT NULL DEFAULT false,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- crear tabla drives
-- source 23-create-drivers-table.sql;

