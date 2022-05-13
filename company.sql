DROP DATABASE IF EXISTS company;
CREATE DATABASE company CHARACTER SET utf8mb4;
USE company;

CREATE TABLE offices (
  office INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  region VARCHAR(50) NOT NULL,
  manager INT UNSIGNED,
  target DECIMAL(9,2) NOT NULL,
  sales DECIMAL(9,2) NOT NULL
);

INSERT INTO offices VALUES (11, 'New York', 'Eastern', 106,  575000, 692637);
INSERT INTO offices VALUES (12, 'Chicago', 'Eastern', 104, 800000, 735042);
INSERT INTO offices VALUES (13, 'Atlanta', 'Eastern', NULL, 350000, 367911);
INSERT INTO offices VALUES (21, 'Los Angeles', 'Western', 108, 725000, 835915);
INSERT INTO offices VALUES (22, 'Denver', 'Western', 108, 300000, 186042);