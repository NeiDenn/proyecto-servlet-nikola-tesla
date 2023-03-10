DROP DATABASE IF EXISTS universidad_nikola_tesla;
CREATE DATABASE universidad_nikola_tesla;
USE universidad_nikola_tesla;

-- TABLAS

CREATE TABLE carrera(
	ide_car int auto_increment,
    des_car varchar(100) not null,
    constraint pk_car primary key (ide_car)
);

CREATE TABLE modalidad(
	ide_mod int auto_increment,
	des_mod varchar(50) not null,
    constraint pk_modalidad primary key (ide_mod) 
);

CREATE TABLE materia(
	ide_mat int auto_increment,
    des_mat varchar(100) not null,
    ide_mod int,
    constraint pk_materia primary key (ide_mat),
    constraint fk_modalidad foreign key (ide_mod) references modalidad (ide_mod)
);

CREATE TABLE profesor(
	ide_pro int auto_increment,
    nom_pro varchar(50) not null,
    ape_pro varchar(50) not null,
    dni_pro char(8) not null,
    gen_pro char(1) not null,
    fec_pro date not null,
    ema_pro varchar(50) not null,
    tel_pro char(15) not null,
    dir_pro varchar(200) not null,
    constraint pk_profesor primary key (ide_pro)
);

CREATE TABLE turno(
	ide_tur int auto_increment,
    des_tur varchar(50) not null,
    constraint pk_turno primary key (ide_tur)
);

CREATE TABLE sede(
	ide_sed int auto_increment,
    des_sed varchar(50) not null,
    constraint pk_sede primary key (ide_sed)
);

CREATE TABLE administrador(
	ide_adm int auto_increment,
    nom_adm varchar(50) not null,
    ape_adm varchar(50) not null,
    dni_adm char(8) not null,
    gen_adm char(1) not null,
    fec_adm date not null,
    ema_adm varchar(50) not null,
    tel_adm char(15) not null,
    dir_adm varchar(200) not null,
    usuario varchar(10) not null,
    contra varchar(15) not null,
    constraint pk_administrador primary key (ide_adm)
);

CREATE TABLE estudiante(
	ide_est int auto_increment,
    nom_est varchar(50) not null,
    ape_est varchar(50) not null,
    dni_est char(8) not null,
    gen_est varchar(20) not null,
    fec_est date not null,
    ema_est varchar(50) not null,
    tel_est char(15) not null,
	dir_est varchar(200) not null,
	constraint pk_estudiante primary key (ide_est)
);

CREATE TABLE matricula(
	num_mat int auto_increment,
    fec_mat date not null,
    ide_adm int,
    ide_est int,
	ide_car int,
    ide_tur int,
    ide_sed int,
    constraint pk_matricula primary key (num_mat),
    constraint fk_administrador foreign key (ide_adm) references administrador (ide_adm),
    constraint fk_estudiante foreign key (ide_est) references estudiante (ide_est),
    constraint fk_carrera foreign key (ide_car) references carrera (ide_car),
    constraint fk_turno foreign key (ide_tur) references turno (ide_tur),
    constraint fk_sede foreign key (ide_sed) references sede (ide_sed)
);

CREATE TABLE contrato(
	num_con int auto_increment,
    fec_con date not null,
	ide_adm int,
    ide_pro int,
    sue_con float not null,
    constraint pk_contrato primary key (num_con),
    constraint fk_administrador_2 foreign key (ide_adm) references administrador (ide_adm),
    constraint fk_profesor_2 foreign key (ide_pro) references profesor (ide_pro)
);

CREATE TABLE materia_profesor(
	ide_mat int,
    ide_pro int,
	constraint fk_mat_pro_1 foreign key (ide_mat) references materia (ide_mat),
	constraint fk_mat_pro_2 foreign key (ide_pro) references profesor (ide_pro)
);

CREATE TABLE materia_estudiante(
	ide_mat int,
    ide_est int,
    constraint fk_mat_est_1 foreign key (ide_mat) references materia (ide_mat),
    constraint fk_mat_est_2 foreign key (ide_est) references estudiante (ide_est)
);

CREATE TABLE estudiante_profesor(
	ide_est int,
    ide_pro int,
    constraint fk_est_pro_1 foreign key (ide_est) references estudiante (ide_est),
    constraint fk_est_pro_2 foreign key (ide_pro) references profesor (ide_pro) 
);

-- INSERCIONES

INSERT INTO carrera VALUES 
(1, "ADMINISTRACI??N Y AFINES"),
(2, "AGRONOM??A"),
(3, "ALTA COSTURA"),
(4, "ANTROPOLOG??A"),
(5, "ARQUEOLOG??A"),
(6, "ARQUITECTURA Y AFINES"),
(7, "ARTES ESC??NICAS Y AFINES"),
(8, "ARTES LIBERALES"),
(9, "ARTES PL??STICAS Y AFINES"),
(10, "BACTERIOLOG??A"),
(11, "BIBLIOTECOLOG??A"),
(12, "BIOINGENIER??A"),
(13, "BIOLOG??A Y AFINES"),
(14, "CARTOGRAF??A"),
(15, "CIENCIAS POL??TICAS"),
(16, "CIENCIAS SOCIALES"),
(17, "CINE, TELEVISI??N Y AFINES"),
(18, "COMERCIO EXTERIOR, NEGOCIOS INTERNACIONALES"),
(19, "COMUNICACI??N E INFORMACI??N"),
(20, "CONSERVACI??N Y RESTAURACI??N DE BIENES"),
(21, "CONTABILIDAD Y AFINES"),
(22, "CRIMINAL??STICA, INVESTIGACI??N JUDICIAL"),
(23, "CULTURA FIS??CA Y DEPORTE"),
(24, "DERECHO"),
(25, "DESARROLLO DE JOYAS, BOLSOS Y CALZADO"),
(26, "DISE??O DE INTERIORES"),
(27, "DISE??O DE MEDIOS INTERACTIVOS"),
(28, "DISE??O DE MODAS"),
(29, "DISE??O GR??FICO"),
(30, "DISE??O INDUSTRIAL"),
(31, "ECOLOG??A Y AFINES"),
(32, "ECONOM??A Y AFINES"),
(33, "ECONOM??A Y NEGOCIOS INTERNACIONALES"),
(34, "EDUCACI??N B??SICA"),
(35, "EDUCACI??N MEDIA"),
(36, "EDUCACI??N PARA OTRAS MODALIDADES"),
(37, "EDUCACI??N PREESCOLAR"),
(38, "ELECTRICIDAD INDUSTRIAL"),
(39, "ENFERMER??A"),
(40, "FILOSOF??A"),
(41, "FINANZAS Y NEGOCIOS INTERNACIONALES"),
(42, "F??SICA"),
(43, "FORMACI??N DE EMPRESARIOS"),
(44, "FOTOGRAF??A"),
(45, "GASTRONOM??A"),
(46, "GEOCIENCIAS"),
(47, "GEOGRAF??A"),
(48, "GEOLOG??A"),
(49, "GESTI??N EMPRESARIAL"),
(50, "GESTI??N FINANCIERA"),
(51, "GESTI??N PORTUARIA"),
(52, "GESTI??N Y DESARROLLO URBANO"),
(53, "HISTORIA"),
(54, "INGENIER??A ADMINISTRATIVA"),
(55, "INGENIER??A AERON??UTICA"),
(56, "INGENIER??A AGR??COLA"),
(57, "INGENIER??A AGROINDUSTRIAL"),
(58, "INGENIER??A AMBIENTAL"),
(59, "INGENIER??A BIOM??DICA"),
(60, "INGENIER??A CIVIL"),
(61, "INGENIER??A COMERCIAL"),
(62, "INGENIER??A DE ALIMENTOS Y AFINES"),
(63, "INGENIER??A DE DISE??O DE PRODUCTO"),
(64, "INGENIER??A DE MINAS"),
(65, "INGENIER??A DE PETR??LEOS"),
(66, "INGENIER??A DE PROCESOS"),
(67, "INGENIER??A DE PRODUCCI??N"),
(68, "INGENIER??A DE SISTEMAS Y AFINES"),
(69, "INGENIER??A DE TELECOMUNICACIONES"),
(70, "INGENIER??A EL??CTRICA"),
(71, "INGENIER??A ELECTROMEC??NICA"),
(72, "INGENIER??A ELECTR??NICA"),
(73, "INGENIER??A FINANCIERA"),
(74, "INGENIER??A F??SICA"),
(75, "INGENIER??A FORESTAL"),
(76, "INGENIER??A GEOL??GICA"),
(77, "INGENIER??A INDUSTRIAL"),
(78, "INGENIER??A INFORM??TICA"),
(79, "INGENIER??A MATERIALES"),
(80, "INGENIER??A MEC??NICA"),
(81, "INGENIER??A MECATR??NICA"),
(82, "INGENIER??A METAL??RGICA"),
(83, "INGENIER??A MULTIMEDIA"),
(84, "INGENIER??A PESQUERA"),
(85, "INGENIER??A QU??MICA"),
(86, "INGENIER??A TEXTIL"),
(87, "INSTRUMENTACI??N QUIR??RGICA"),
(88, "JURISPRUDENCIA"),
(89, "LENGUAS MODERNAS Y AFINES"),
(90, "LICENCIATURA EN PEDAGOG??A INFANTIL"),
(91, "LITERATURA, LING????STICA Y AFINES"),
(92, "MATEM??TICAS, ESTAD??STICA Y AFINES"),
(93, "MEDICINA"),
(94, "MEDICINA VETERINARIA"),
(95, "MERCADEO"),
(96, "MERCADEO INTERNACIONAL"),
(97, "MICROBIOLOG??A"),
(98, "MUSEOLOG??A"),
(99, "M??SICA Y AFINES"),
(100, "NUTRICI??N Y DIET??TICA"),
(101, "OBSTETRICIA"),
(102, "ODONTOLOG??A"),
(103, "OPERACI??N LOG??STICA"),
(104, "OPTOMETR??A"),
(105, "PEDAGOG??A REEDUCATIVA"),
(106, "PROCESOS INDUSTRIALES"),
(107, "PROGRAMACI??N DE COMPUTADORES"),
(108, "PSICOLOG??A"),
(109, "PUBLICIDAD Y AFINES"),
(110, "QU??MICA FARMACE??TICA"),
(111, "QU??MICA Y AFINES"),
(112, "SALUD OCUPACIONAL"),
(113, "SISTEMAS DE INFORMACI??N"),
(114, "SOCIOLOG??A"),
(115, "TALENTO HUMANO"),
(116, "TEOLOG??A Y AFINES"),
(117, "TERAPIA F??SICA, FISIOTERAPIA Y AFINES"),
(118, "TERAPIA OCUPACIONAL"),
(119, "TERAPIA RESPIRATORIA"),
(120, "TRABAJO SOCIAL"),
(121, "TURISMO, HOTELER??A Y AFINES"),
(122, "ZOOTECNIA");

INSERT INTO modalidad VALUES
(1, "PRESENCIAL"),
(2, "VIRTUAL"),
(3, "A DISTANCIA"),
(4, "SEMIPRESENCIAL");

INSERT INTO materia VALUES
(1, "ADMINISTRACI??N Y NEGOCIOS", 1),
(2, "AGRICULTURA Y AGRONOM??A", 2),
(3, "ALIMENTACI??N Y NUTRICI??N", 3),
(4, "ADMINISTRACI??N Y NEGOCIOS", 4),
(5, "ALTA GERENCIA Y LIDERAZGO", 2),
(6, "ARQUITECTURA Y URBANISMO", 3),
(7, "ARTE, CINE Y TELEVISI??N", 1),
(8, "AUDITOR??A Y CONTROL INTERNO", 4),
(9, "BANCA Y FINANZAS", 3),
(10, "CALIDAD Y SERVICIO AL CLIENTE", 2),
(11, "CIENCIAS B??SICAS Y EXACTAS", 4),
(12, "CIENCIAS BIOL??GICAS", 1),
(13, "CIENCIAS DE LA SALUD", 1),
(14, "CIENCIAS SOCIALES", 2),
(15, "COMERCIAL Y VENTAS", 1),
(16, "COMERCIO EXTERIOR Y RELACIONES INTERNACIONALES", 2),
(17, "COMUNICACI??N Y PERIODISMO", 1),
(18, "CONTADUR??A, TESORER??A Y CONTABILIDAD", 2),
(19, "DEPORTES Y EDUCACI??N F??SICA", 4),
(20, "DERECHO Y CIENCIAS POL??TICAS", 2),
(21, "DISE??O", 1),
(22, "ECOLOG??A Y MEDIO AMBIENTE", 4),
(23, "ECONOM??A", 3),
(24, "ECONOM??A SOLIDARIA", 2),
(25, "EDUCACI??N Y PEDAGOG??A", 1),
(26, "GASTRONOM??A", 3),
(27, "GESTI??N HUMANA Y PSICOLOG??A", 1),
(28, "HOTELER??A Y TURISMO", 1),
(29, "HUMANIDADES, FILOSOF??A Y TEOLOG??A", 2),
(30, "IDIOMAS", 3),
(31, "INGENIER??A", 1),
(32, "LOG??STICA E INVENTARIOS", 2),
(33, "MANUALIDADES Y DECORACI??N", 1),
(34, "MERCADEO Y PUBLICIDAD", 1),
(35, "NEGOCIACI??N", 2),
(36, "PRODUCCI??N Y OPERACI??N", 2),
(37, "SEGURIDAD Y PROTECCI??N", 2),
(38, "SISTEMAS E INFORM??TICA", 1),
(39, "TELECOMUNICACIONES", 1),
(40, "VETERINARIA Y ZOOTECNIA", 4);

INSERT INTO profesor VALUES
(1, "Ascensi??n", "Fabregat R??denas", "68478144", "F", "1985-12-25", "i201871809@tesla.com", "911873993", "Av. Hip??lito Vallejo # 4"),
(2, "Mat??as ??lvaro", "Egea Morillo", "56285418", "M", "1987-05-15", "i201960958@tesla.com", "992297065", "Av. Pedro Zaragoza # 335"),
(3, "Natividad", "Segovia Feijoo", "25398261", "F", "1986-07-26", "i202135079@tesla.com", "957401359", "Urb. Lorenzo Nieves # 14"),
(4, "Albina", "Arregui Tejera", "61238438", "F", "1988-11-21", "i202210946@tesla.com", "962116124", "Cl. Alejandra Tafoya # 26"),
(5, "Sandalio", "Cerezo Cuenca", "73703469", "M", "1985-02-23", "i202129448@tesla.com", "974325791", "Av. Alexander Brise??o # 02"),
(6, "Jos?? Mar??a", "Farr?? Castrillo", "90480069", "M", "1982-05-28", "i202005724@tesla.com", "993847635", "Av. Delfina Arredondo # 390"),
(7, "Te??fila", "Rubio Atienza", "76778511", "F", "1979-09-15", "i202284442@tesla.com", "991128503", "Cl. Valentino Varela # 81"),
(8, "Marc", "Ru??z Salazar", "28353699", "M", "1975-01-16", "i201964716@tesla.com", "940303971", "Jr. Abril Valdez # 4"),
(9, "Jose Chuy", "Cases Vaquero", "36788070", "M", "1981-09-12", "i201836439@tesla.com", "925235859", "Urb. M??ximo Olvera # 32570"),
(10, "Odalys", "Izaguirre Garc??a", "43934856", "F", "1986-10-17", "i201681523@tesla.com", "948828637", "Jr. Josefa De La Rosa # 29"),
(11, "Gracia", "Marcos Ricart", "16362659", "F", "1985-06-15", "i201834085@tesla.com", "957627567", "Av. Lautaro Castellanos # 4"),
(12, "Georgina", "Mateo Berm??dez", "62033342", "F", "1991-04-18", "i201820458@tesla.com", "984672681", "Jr. Alejandro Saavedra # 18"),
(13, "Cristian", "Palma Infante", "54104048", "M", "1987-10-30", "i201562687@tesla.com", "996731418", "Urb. Ashley Cab??n # 4"),
(14, "Maura", "Gordillo Fernadez", "42438359", "F", "1975-12-19", "i201967049@tesla.com", "985193955", "Av. Violeta Men??ndez # 66"),
(15, "F??tima", "del Jove Aroni", "43749060", "F", "1979-10-21", "i202066944@tesla.com", "963155204", "Av. Mario Escalante # 4660"),
(16, "Juan Luis", "Borja Barrio", "86772059", "M", "1981-08-22", "i201756168@tesla.com", "936949950", "Jr. Paula Ferrer # 02"),
(17, "Armando", "del Pons Lebr??n", "78051930", "M", "1983-05-10", "i201646685@tesla.com", "937362099", "Jr. Regina Robledo # 46"),
(18, "Elena", "del Sierra Oviedo", "49240636", "F", "1986-03-19", "i201958946@tesla.com", "968627659", "Av. Josu?? Nazario # 90409"),
(19, "Esperanza", "Asensio Monreal", "44100383", "F", "1980-11-17", "i202048657@tesla.com", "906914554", "Jr. Emily Casares # 843"),
(20, "Herberto", "Calvo Llano", "89853999", "M", "1990-10-18", "i201781221@tesla.com", "959741589", "Cl. Julieta Ara??a # 39");

INSERT INTO turno VALUES
(1, "MA??ANA"),
(2, "TARDE"),
(3, "NOCHE");

INSERT INTO sede VALUES
(1, "AMAZONAS"),
(2, "ANCASH"),
(3, "APURIMAC"),
(4, "AREQUIPA"),
(5, "AYACUCHO"),
(6, "CAJAMARCA"),
(7, "CALLAO"),
(8, "CUSCO"),
(9, "HUANCAVELICA"),
(10, "HUANUCO"),
(11, "ICA"),
(12, "JUN??N"),
(13, "LA LIBERTAD"),
(14, "LAMBAYEQUE"),
(15, "LIMA"),
(16, "LORETO"),
(17, "MADRE DE DIOS"),
(18, "MOQUEGUA"),
(19, "PASCO"),
(20, "PIURA"),
(21, "PUNO"),
(22, "SAN MART??N"),
(23, "TACNA"),
(24, "TUMBES"),
(25, "UCAYALI");

INSERT INTO administrador VALUES
(1, "Andr??s", "Fuster Arregui", "18899492", "M", "1985-10-03", "i866474621@tesla.com", "935452995","Jr. Isabel Oliv??rez # 7", "i202115024", "tc6IX71"),
(2, "Reyna F??tima", "Verd?? Nicol??s", "90929968", "F", "1990-11-10", "i889447885@tesla.com", "960767737","Urb. Luciano Tello # 5785", "i20211815", "O4zPd0u"),
(3, "Am??lcar", "??vila Escalona", "85937814", "M", "1989-05-16", "i933535925@tesla.com", "912701160","Jr. Luana Villegas # 994", "i202110405", "B8y95pZ");

INSERT INTO estudiante VALUES
(1, "Eloy", "Recio Amor??s", "70529054", "M", "2002-12-05", "i836256880@tesla.com", "929937142", "Jr. Mario Sanabria # 46"),
(2, "Emma", "Lamas Losada", "88014149", "F", "2003-05-12", "i263184428@tesla.com", "945126407", "Cl. Malena Sep??lveda # 50930"),
(3, "Gervasio", "Serra Almagro", "44741869", "M", "2001-10-18", "i394299625@tesla.com", "918078858", "Av. Montserrat Barreto # 113 Piso 80"),
(4, "Abiga??l Roxana", "Fuertes Sevilla", "33424293", "F", "2000-12-15", "i272508102@tesla.com", "910639666", "Cl. El??as Zamudio # 1 Piso 90"),
(5, "??ngeles", "Gallardo Blanca", "58810625", "F", "2003-08-16", "i156135399@tesla.com", "976942400", "Cl. Juan Sebasti??n Acosta # 8 Piso 4"),
(6, "P??a", "Carrera Salcedo", "69578866", "F", "2002-04-19", "i651369891@tesla.com", "996349944", "Jr. Camila Guzm??n # 3"),
(7, "Donato", "Llorente Abad", "43378634", "M", "2001-10-17", "i969790791@tesla.com", "974190508", "Calle 13, Sector #24"),
(8, "Danilo", "Osuna Borrell", "12685607", "M", "2003-12-13", "i749685960@tesla.com", "996063151", "Urb. Carla C??rdova # 86569 Piso 18"),
(9, "Florencio", "Lasa Ramis", "42499999", "M", "2000-11-24", "i502501469@tesla.com", "919774652", "Urb. Matthew Mesa # 8448"),
(10, "Abraham", "Blanch Juan", "18774159", "M", "2001-09-05", "i536068712@tesla.com", "941163110", "Jr. Sof??a Salinas # 525 Piso 98");

INSERT INTO matricula VALUES
(1, "2022-11-05", 2, 1, 29, 1, 4),
(2, "2022-11-04", 1, 2, 119, 2, 4),
(3, "2022-11-03", 2, 3, 58, 3, 15),
(4, "2022-11-04", 3, 4, 47, 1, 15),
(5, "2022-11-05", 1, 5, 36, 3, 4),
(6, "2022-11-03", 2, 6, 25, 1, 15),
(7, "2022-11-02", 1, 7, 52 , 1, 8),
(8, "2022-11-02", 2, 8, 65, 2, 8),
(9, "2022-11-01", 3, 9, 74, 2, 4),
(10, "2022-11-05", 1, 10, 83, 3, 15);

INSERT INTO contrato VALUES
(1, "2022-11-25", 1, 1, 3499.99),
(2, "2021-10-29", 2, 2, 4449.99),
(3, "2021-01-18", 3, 3, 4499.99),
(4, "2021-02-19", 1, 4, 3799.99),
(5, "2020-09-17", 2, 5, 3999.99),
(6, "2022-05-18", 2, 6, 2499.99),
(7, "2021-09-15", 1, 7, 1499.99),
(8, "2022-09-14", 3, 8, 1899.99),
(9, "2021-04-18", 3, 9, 1999.99),
(10, "2020-05-19", 3, 10, 3899.99),
(11, "2021-09-18", 2, 11, 1899.99),
(12, "2019-08-17", 2, 12, 2599.99),
(13, "2018-07-19", 1, 13, 1799.99),
(14, "2017-09-16", 1, 14, 2799.99),
(15, "2020-11-15", 2, 15, 2899.99),
(16, "2020-12-15", 2, 16, 3599.99),
(17, "2019-01-16", 3, 17, 3399.99),
(18, "2018-03-17", 3, 18, 3799.99),
(19, "2017-03-18", 2, 19, 3099.99),
(20, "2017-03-20", 1, 20, 3499.99);

/*INSERT INTO materia_profesor VALUES
(1, 1),
(4, 1),
(9, 1),
(13, 2),
(21, 3),
(30, 4),
(37, 4),
(38, 4),
(26, 5),
(28, 6),
(29, 7),
(15, 8),
(16, 8),
(25, 9),
(3, 10);

INSERT INTO materia_estudiante VALUES
(1, 1),
(4, 1),
(9, 2),
(13, 2),
(21, 3),
(30, 3),
(37, 3),
(38, 4),
(26, 5),
(28, 6),
(29, 7),
(15, 7),
(16, 8),
(25, 9),
(3, 10);

INSERT INTO estudiante_profesor VALUES
(1, 1),
(1, 1),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(3, 4),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(7, 8),
(8, 8),
(9, 9),
(10, 10);


CONSULTAS 

SELECT * FROM carrera;
SELECT * FROM modalidad;
SELECT * FROM materia;
SELECT * FROM profesor;
SELECT * FROM turno;
SELECT * FROM sede;
SELECT * FROM administrador;
SELECT * FROM estudiante;
SELECT * FROM materia_profesor;
SELECT * FROM materia_estudiante;
SELECT * FROM estudiante_profesor;
SELECT * FROM matricula;
SELECT * FROM contrato;

*/
/*
select m.num_mat, m.fec_mat, concat(a.nom_adm,space(1),a.ape_adm), concat(e.nom_est,space(1),e.ape_est), c.des_car, t.des_tur, s.des_sed from matricula m 
	inner join administrador a on m.ide_adm = a.ide_adm
    inner join estudiante e on m.ide_est = e.ide_est
    inner join carrera c on m.ide_car = c.ide_car 
    inner join turno t on m.ide_tur = t.ide_tur
    inner join sede s on m.ide_sed = s.ide_sed
;

select c.num_con, c.fec_con, concat(a.nom_adm, space(1), a.ape_adm), concat(p.nom_pro, space(1), p.ape_pro), c.sue_con from contrato c
	inner join administrador a on c.ide_adm = a.ide_adm
    inner join profesor p on c.ide_pro = p.ide_pro
;
*/

-- select m.ide_mat,m.des_mat,md.des_mod from materia m inner join modalidad md on m.ide_mod=md.ide_mod;
-- select * from modalidad;

-- update materia set des_mat="FARMACOS",ide_mod=2 where ide_mat = 1;

SELECT * FROM administrador;