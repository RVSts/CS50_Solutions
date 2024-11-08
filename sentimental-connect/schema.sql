CREATE DATABASE `linkedin`;

USE `linkedin`;

CREATE TABLE `users`
    `id` BIGINT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(16),
    `last_name` VARCHAR(32),
    `username` VARCHAR(32) UNIQUE,
    `password` VARCHAR(128),
    PRIMARY KEY(`id`);

CREATE TABLE `schools_universities`
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64),
    `type` ENUM(`Primary`, `Secondary`, `Higher Education`),
    `location` TEXT,
    `year` VARCHAR(4),
    PRIMARY KEY (`id`);

CREATE TABLE `companies`
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64),
    `type` ENUM(`Technology`, `Education`, `Business`)
    PRIMARY KEY (`id`);

CREATE TABLE `connections_people`
    `id` BIGINT UNSIGNED AUTO_INCREMENT,
    `first_person_id` BIGINT UNSIGNED,
    `second_person_id` BIGINT UNSIGNED,
    FOREIGN KEY(`first_person_id`) REFERENCES TO `users`(`id`),
    FOREIGN KEY (`second_person_id`) REFERENCES TO `users`(`id`),
    PRIMARY KEY (`id`);


CREATE TABLE `connections_schools`
    `id`BIGINT UNSIGNED AUTO_INCREMENT,
    `person_id` BIGINT UNSIGNED,
    `school_id` INT UNSIGNED,
    `start_date` DATE,
    `end_date` DATE,
    `type` ENUM(`BA`, `MA`, `PhD`),
    FOREIGN KEY(`person_id`) REFERENCES TO `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES TO `schools_universities`(`id`),
    PRIMARY KEY (`id`);

CREATE TABLE `connections_companies`
    `id` BIGINT UNSIGNED AUTO_INCREMENT,
    `person_id` BIGINT UNSIGNED,
    `company_id` INT UNSIGNED,
    `start_date` DATE,
    `end_date` DATE,
    FOREIGN KEY(`person_id`) REFERENCES TO `users`(`id`),
    PRIMARY KEY(`company_id`) REFERENCES TO `companies`(`id`),
    PRIMARY KEY (`id`);
