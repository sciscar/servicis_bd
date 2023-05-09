drop database if exists familia;
create database familia;
use familia;

create table persones (
codi integer primary key,
nom varchar(20),
pare integer references persones(codi),
mare integer references persones(codi)
) engine = "InnoDB";

insert into persones values
(100, "Cella Blanca", null, null), 
(101, "La Piula", null, null),
(9, "Daniel Garcia", 100, null),
(10, "Assumpció Simeón", null, 101),
(11, "Pepe Burguera", null, null),
(12, "Assumpció Fos", null, null),
(5, "Paco G.S.", 9, 10),
(6, "Sales", 11, 12),
(7, "Pepe", null, null),
(8, "Assumpció Palàcios", null, null),
(3, "Abdó", 5, 6),
(4, "Alícia", 7,8),
(1, "Neus", 3, 4),
(2, "Miquel", 3, 4),
(13, "Paco", 5, 6),
(14, "Jose", 5, 6),
(15, "M.José", null, null),
(16, "Eva", null, null),
(17, "Celia", 13, 15),
(18, "Judit", 13, 15),
(19, "Assumpta", 14, 16),
(20, "Raül", 14, 16),
(21 , "Maria", 7, 8),
(22 , "Espe", 7, 8),
(23 , "Jose M.", 7, 8),
(24 , "Carles", 7, 8),
(25, "Ferran", null, null),
(26, "Xavi", null, null),
(27, "M.Àngels", null, null),
(28, "Paueta", null, null),
(29, "Anna Li", 25, 21),
(30, "Laura", 26, 22),
(31, "Andreu", 26, 22),
(32, "Helena", 26, 22),
(33, "Àngels", 23, 27),
(34, "Roc", 24, 28);






