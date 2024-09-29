CREATE TABLE `myProjects` (
id binary(2) NOT NULL PRIMARY KEY,
projectType char(1) NOT NULL,
labNum int(10),
title char(255),
`location` char(255),
imageLink char(255),
`description` varchar (500)
);
