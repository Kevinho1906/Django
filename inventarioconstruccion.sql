-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2023 a las 16:57:20
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventarioconstruccion`
--
CREATE DATABASE IF NOT EXISTS `inventarioconstruccion` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `inventarioconstruccion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_detalleentradamaterial`
--

CREATE TABLE `appgestioninventario_detalleentradamaterial` (
  `id` bigint(20) NOT NULL,
  `detCantidad` int(11) NOT NULL COMMENT 'Cantidad que ingresa del material',
  `detPrecioUnitario` int(11) NOT NULL COMMENT 'Precio del material que ingresa',
  `devEstado` varchar(7) NOT NULL COMMENT 'estado del Elemento',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `detEntradaMaterial_id` bigint(20) NOT NULL COMMENT 'Hace referencia a la Entrada registrada',
  `detMaterial_id` bigint(20) NOT NULL COMMENT 'Hace referencia al material que se está registrando en la entrada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_detallesolicitud`
--

CREATE TABLE `appgestioninventario_detallesolicitud` (
  `id` bigint(20) NOT NULL,
  `detCantidadRequerida` int(11) NOT NULL COMMENT 'Cantidad requerida del elemento',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `detElemento_id` bigint(20) NOT NULL COMMENT 'Elemento que se está solicitando',
  `detSolicitud_id` bigint(20) NOT NULL COMMENT 'Hace referencia a la solicitud del detalle que se va a registrar',
  `detUnidadMedida_id` bigint(20) NOT NULL COMMENT 'Unidad de médida del elemento que se requeire'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_devolucionelemento`
--

CREATE TABLE `appgestioninventario_devolucionelemento` (
  `id` bigint(20) NOT NULL,
  `devCantidadDevolucion` int(11) NOT NULL COMMENT 'Cantidad devuelta por el instructor después                                     de utilizarla en la formación',
  `devObservaciones` longtext DEFAULT NULL COMMENT 'Observaciones que el asistente quiera                                     agregar en la devolución',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `devSalida_id` bigint(20) NOT NULL COMMENT 'Hace referencia a la salida de los elementos',
  `devUsuario_id` bigint(20) NOT NULL COMMENT 'Usuario que hace la devolución de elementos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_devolutivo`
--

CREATE TABLE `appgestioninventario_devolutivo` (
  `id` bigint(20) NOT NULL,
  `devPlacaSena` varchar(45) NOT NULL COMMENT 'Código Inventario SENA',
  `devSerial` varchar(45) DEFAULT NULL COMMENT 'Seríal del elemento devolutivo',
  `devDescripcion` longtext NOT NULL COMMENT 'Descripción del elemento devolutivo',
  `devMarca` varchar(50) DEFAULT NULL COMMENT 'Marca del Elemento Devolutivo',
  `devFechaIngresoSENA` date NOT NULL COMMENT 'Fecha de ingreso del elemento al inventario SENA',
  `devValor` decimal(11,2) NOT NULL COMMENT 'Valor del elemento registrado inventario SENA',
  `devFoto` varchar(100) DEFAULT NULL COMMENT 'Foto del Elemento Devolutivo',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `devElemento_id` bigint(20) NOT NULL COMMENT 'Hace relación al elemento FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `appgestioninventario_devolutivo`
--

INSERT INTO `appgestioninventario_devolutivo` (`id`, `devPlacaSena`, `devSerial`, `devDescripcion`, `devMarca`, `devFechaIngresoSENA`, `devValor`, `devFoto`, `fechaHoraCreacion`, `fechaHoraActualizacion`, `devElemento_id`) VALUES
(1, 'dfgfhggh', '123', 'fxbfffb', 'Samsumg', '2023-05-18', '2000000.00', 'elementos/tv.jpg', '2023-05-18 16:25:56.357088', '2023-05-18 16:25:56.357088', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_elemento`
--

CREATE TABLE `appgestioninventario_elemento` (
  `id` bigint(20) NOT NULL,
  `eleCodigo` varchar(15) NOT NULL COMMENT 'Código único asignado al elemento',
  `eleNombre` varchar(50) NOT NULL COMMENT 'Nombre del Elemento',
  `eleTipo` varchar(3) NOT NULL COMMENT 'Tipo de Elemento',
  `eleEstado` varchar(10) NOT NULL COMMENT 'Estado del elemento devolutivo',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `appgestioninventario_elemento`
--

INSERT INTO `appgestioninventario_elemento` (`id`, `eleCodigo`, `eleNombre`, `eleTipo`, `eleEstado`, `fechaHoraCreacion`, `fechaHoraActualizacion`) VALUES
(1, 'EQU00001', 'TV', 'EQU', 'Bueno', '2023-05-18 16:25:56.335114', '2023-05-18 16:25:56.335114');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_entradamaterial`
--

CREATE TABLE `appgestioninventario_entradamaterial` (
  `id` bigint(20) NOT NULL,
  `entNumeroFactura` varchar(15) NOT NULL COMMENT 'Número de la factura',
  `entFechaHora` datetime(6) NOT NULL COMMENT 'Fecha y hora que entregan los elementos',
  `entEntregadoPor` varchar(100) NOT NULL COMMENT 'Nombre persona que entrega los materiales',
  `entObservaciones` longtext DEFAULT NULL COMMENT 'Observaciones que se requieran hacer',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `entProveedor_id` bigint(20) NOT NULL COMMENT 'Hace referencia al proveedor que entrea los materiales',
  `entUsuarioRecibe_id` bigint(20) NOT NULL COMMENT 'Hace referencia a usuario de construcción que recibe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_estadomantenimiento`
--

CREATE TABLE `appgestioninventario_estadomantenimiento` (
  `id` bigint(20) NOT NULL,
  `estNombre` varchar(50) NOT NULL COMMENT 'Nombre del estado del mantenimiento',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_ficha`
--

CREATE TABLE `appgestioninventario_ficha` (
  `id` bigint(20) NOT NULL,
  `ficCodigo` int(11) NOT NULL COMMENT 'Código de la Ficha',
  `ficNombre` varchar(100) NOT NULL COMMENT 'Nombre del programa de la Ficha',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_mantenimento`
--

CREATE TABLE `appgestioninventario_mantenimento` (
  `id` bigint(20) NOT NULL,
  `manObservaciones` longtext DEFAULT NULL COMMENT 'Observaciones que se quieran agregar                                 al mantenimiento',
  `manFechaHoraMantenimiento` datetime(6) NOT NULL COMMENT 'Hace referencia a la fecha y hora que                                 se realizó el mantenimiento',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `manElemento_id` bigint(20) NOT NULL COMMENT 'Hace referencia al elemento que se le realizó el mantenimiento',
  `manEstado_id` bigint(20) NOT NULL COMMENT 'Hace referencia al estado del mantenimiento',
  `manUsuario_id` bigint(20) NOT NULL COMMENT 'Hace referencia al usuario que realizó el mantenimiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_material`
--

CREATE TABLE `appgestioninventario_material` (
  `id` bigint(20) NOT NULL,
  `matReferencia` longtext DEFAULT NULL COMMENT 'Referencia o descripción del material',
  `matMarca` varchar(50) DEFAULT NULL COMMENT 'Marca del material si tiene',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `matElemento_id` bigint(20) NOT NULL COMMENT 'Hace referencia al Elemento FK',
  `matUnidadMedida_id` bigint(20) NOT NULL COMMENT 'Hace referencia a la Unidad de Medida FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_proveedor`
--

CREATE TABLE `appgestioninventario_proveedor` (
  `id` bigint(20) NOT NULL,
  `proTipo` varchar(20) NOT NULL COMMENT 'Tipo de proveedor',
  `proIdentificacion` varchar(15) NOT NULL COMMENT 'Identificación del proveedor, puede ser cédula o Nit',
  `proNombre` varchar(60) NOT NULL COMMENT 'Nombre del proveedor',
  `proRepresentanteLegal` varchar(60) DEFAULT NULL COMMENT 'Nombre representante legal si es persona Júridica',
  `proTelefono` varchar(15) DEFAULT NULL COMMENT 'Número telefono del proveedor',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_salidadetallesolicitud`
--

CREATE TABLE `appgestioninventario_salidadetallesolicitud` (
  `id` bigint(20) NOT NULL,
  `salCantidadEntregada` int(11) NOT NULL COMMENT 'Cantidad entregada',
  `salObservaciones` longtext DEFAULT NULL COMMENT 'Observaciobes que el asistente quiera agregar',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `salDetalleSolicitud_id` bigint(20) NOT NULL COMMENT 'Hace referencia al detalle de la solicitud'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_solicitudelemento`
--

CREATE TABLE `appgestioninventario_solicitudelemento` (
  `id` bigint(20) NOT NULL,
  `solProyecto` longtext NOT NULL COMMENT 'Nombre proyecto que el instructor está desarrollando con la ficha',
  `solFechaHoraRequerida` datetime(6) DEFAULT NULL COMMENT 'Fecha y hora que requiere los elementos',
  `solEstado` varchar(10) NOT NULL COMMENT 'Estado de la solicitud',
  `solObservaciones` longtext DEFAULT NULL COMMENT 'Alguna observación que el instructor quiera agregar en la solicitud',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `solFicha_id` bigint(20) NOT NULL COMMENT 'Ficha en la que el instructor utilizará los elementos',
  `solUsuario_id` bigint(20) NOT NULL COMMENT 'Usuario instructor que hace la solicitud'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_ubicacionfisica`
--

CREATE TABLE `appgestioninventario_ubicacionfisica` (
  `id` bigint(20) NOT NULL,
  `ubiDeposito` smallint(6) NOT NULL COMMENT 'Número de bodega: 1,2,3,4..',
  `ubiEstante` smallint(6) DEFAULT NULL COMMENT 'Número de bodega: 1,2,3,4..',
  `ubiEntrepano` smallint(6) DEFAULT NULL COMMENT 'Número de Entrepaño: 1,2,3,4..',
  `ubiLocker` smallint(6) DEFAULT NULL COMMENT 'Número de locker: 1,2,3,4..',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `ubiElemento_id` bigint(20) NOT NULL COMMENT 'Hace referencia al elemento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `appgestioninventario_ubicacionfisica`
--

INSERT INTO `appgestioninventario_ubicacionfisica` (`id`, `ubiDeposito`, `ubiEstante`, `ubiEntrepano`, `ubiLocker`, `fechaHoraCreacion`, `fechaHoraActualizacion`, `ubiElemento_id`) VALUES
(1, 5, 0, 0, 0, '2023-05-18 16:25:56.336112', '2023-05-18 16:25:56.336112', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_unidadmedida`
--

CREATE TABLE `appgestioninventario_unidadmedida` (
  `id` bigint(20) NOT NULL,
  `uniNombre` varchar(45) NOT NULL COMMENT 'Nombre de la Unidad de Médida',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_user`
--

CREATE TABLE `appgestioninventario_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `userFoto` varchar(100) DEFAULT NULL COMMENT 'Foto del Usuario',
  `userTipo` varchar(15) NOT NULL COMMENT 'Nombre Tipo de usuario',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `appgestioninventario_user`
--

INSERT INTO `appgestioninventario_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `userFoto`, `userTipo`, `fechaHoraCreacion`, `fechaHoraActualizacion`) VALUES
(1, 'pbkdf2_sha256$600000$pXVJdSeQXGzGCAKKCa6U5L$8H4rR7wdPlzEgrbyGKuTxj5wJ48+dzLLDJHr0e0jo1w=', '2023-05-18 15:31:23.630455', 1, 'Admin', '', '', 'kevinmurillobetancourt@gmail.com', 1, 1, '2023-05-04 15:20:16.824051', '', '', '2023-05-04 15:20:17.111556', '2023-05-04 15:20:17.111556'),
(3, 'pbkdf2_sha256$600000$K9DHKW0g4wenJrNJCeMEVG$BgUYNEGNYcymG1acPFCs1ujpusJT1KCQusIgwUYepRI=', '2023-05-15 12:46:06.314578', 0, 'ccuellar', 'cesar', 'cuellar', 'ccuellar@misena.edu.co', 1, 1, '2023-05-15 12:36:51.000000', '', 'Instructor', '2023-05-15 12:38:05.612236', '2023-05-15 12:45:47.296043'),
(4, 'pbkdf2_sha256$600000$0uob5A8U176JV09ldDCeCe$Be4V/f+0rPsIEJZbwU+xl5M4OlZi/+6Zx97iwQV31uI=', '2023-05-18 16:17:13.162039', 1, 'KevinM', '', '', 'kevinmurillobetancourt@gmail.com', 1, 1, '2023-05-15 12:52:07.000000', '', 'Administrativo', '2023-05-15 12:52:07.377401', '2023-05-18 15:31:34.258687'),
(8, 'pbkdf2_sha256$600000$dJe4sdNS8h2f9BQEalnvl0$dcNAden0aafDofW+/ZOhymqmRzDAwNF1eXTsaNMVot0=', '2023-05-18 16:22:27.359884', 0, 'kevinstivenmurillo1906@gmail.com', 'Kmurillo', 'Betancourt', 'kevinstivenmurillo1906@gmail.com', 0, 1, '2023-05-18 15:48:03.673600', 'fotos/televisor_WsOLb6B.jfif', 'Aprendiz', '2023-05-18 15:48:05.037569', '2023-05-18 15:48:05.359703'),
(9, 'pbkdf2_sha256$600000$GMK5YkJ4ehbJGFQMoV9x7m$S1RN0EIe0cJ+K2vfydXuKoVPkC4kauEs+JcNB5HDL5M=', '2023-05-18 16:16:01.215535', 0, 'dayanasotol2005@gmail.com', 'Dayana', 'Soto', 'dayanasotol2005@gmail.com', 0, 1, '2023-05-18 16:11:32.313092', 'fotos/logo_contruc_FkxBkhv.png', 'Instructor', '2023-05-18 16:11:32.328671', '2023-05-18 16:11:32.626905');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_user_groups`
--

CREATE TABLE `appgestioninventario_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `appgestioninventario_user_groups`
--

INSERT INTO `appgestioninventario_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 3, 2),
(12, 4, 1),
(13, 8, 2),
(14, 9, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_user_user_permissions`
--

CREATE TABLE `appgestioninventario_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Asistente'),
(3, 'Instructor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 21),
(2, 1, 22),
(3, 1, 23),
(4, 1, 24),
(5, 1, 25),
(6, 1, 26),
(7, 1, 27),
(8, 1, 28),
(9, 1, 29),
(10, 1, 30),
(11, 1, 31),
(12, 1, 32),
(13, 1, 33),
(14, 1, 34),
(15, 1, 35),
(16, 1, 36),
(17, 1, 37),
(18, 1, 38),
(19, 1, 39),
(20, 1, 40),
(21, 1, 41),
(22, 1, 42),
(23, 1, 43),
(24, 1, 44),
(25, 1, 45),
(26, 1, 46),
(27, 1, 47),
(28, 1, 48),
(29, 1, 49),
(30, 1, 50),
(31, 1, 51),
(32, 1, 52),
(33, 1, 53),
(34, 1, 54),
(35, 1, 55),
(36, 1, 56),
(37, 1, 57),
(38, 1, 58),
(39, 1, 59),
(40, 1, 60),
(41, 1, 61),
(42, 1, 62),
(43, 1, 63),
(44, 1, 64),
(45, 1, 65),
(46, 1, 66),
(47, 1, 67),
(48, 1, 68),
(49, 1, 69),
(50, 1, 70),
(51, 1, 71),
(52, 1, 72),
(53, 1, 73),
(54, 1, 74),
(55, 1, 75),
(56, 1, 76),
(57, 1, 77),
(58, 1, 78),
(59, 1, 79),
(60, 1, 80),
(61, 1, 81),
(62, 1, 82),
(63, 1, 83),
(64, 1, 84),
(65, 2, 21),
(66, 2, 22),
(67, 2, 23),
(68, 2, 24),
(69, 2, 25),
(70, 2, 26),
(71, 2, 27),
(72, 2, 28),
(73, 2, 29),
(74, 2, 30),
(75, 2, 31),
(76, 2, 32),
(77, 2, 33),
(78, 2, 34),
(79, 2, 35),
(80, 2, 36),
(81, 2, 37),
(82, 2, 38),
(83, 2, 39),
(84, 2, 40),
(85, 2, 41),
(86, 2, 42),
(87, 2, 43),
(88, 2, 44),
(89, 2, 45),
(90, 2, 46),
(91, 2, 47),
(92, 2, 48),
(93, 2, 49),
(94, 2, 50),
(95, 2, 51),
(96, 2, 52),
(97, 2, 53),
(98, 2, 54),
(99, 2, 55),
(100, 2, 56),
(101, 2, 57),
(102, 2, 58),
(103, 2, 59),
(104, 2, 60),
(105, 2, 61),
(106, 2, 62),
(107, 2, 63),
(108, 2, 64),
(109, 2, 65),
(110, 2, 66),
(111, 2, 67),
(112, 2, 68),
(113, 2, 69),
(114, 2, 70),
(115, 2, 71),
(116, 2, 72),
(117, 2, 73),
(118, 2, 74),
(119, 2, 75),
(120, 2, 76),
(121, 2, 77),
(122, 2, 78),
(123, 2, 79),
(124, 2, 80),
(125, 2, 81),
(126, 2, 82),
(127, 2, 83),
(128, 2, 84),
(129, 3, 21),
(130, 3, 22),
(131, 3, 23),
(132, 3, 24),
(133, 3, 25),
(134, 3, 26),
(135, 3, 27),
(136, 3, 28),
(137, 3, 29),
(138, 3, 30),
(139, 3, 31),
(140, 3, 32),
(141, 3, 33),
(142, 3, 34),
(143, 3, 35),
(144, 3, 36),
(145, 3, 37),
(146, 3, 38),
(147, 3, 39),
(148, 3, 40),
(149, 3, 41),
(150, 3, 42),
(151, 3, 43),
(152, 3, 44),
(153, 3, 45),
(154, 3, 46),
(155, 3, 47),
(156, 3, 48),
(157, 3, 49),
(158, 3, 50),
(159, 3, 51),
(160, 3, 52),
(161, 3, 53),
(162, 3, 54),
(163, 3, 55),
(164, 3, 56),
(165, 3, 57),
(166, 3, 58),
(167, 3, 59),
(168, 3, 60),
(169, 3, 61),
(170, 3, 62),
(171, 3, 63),
(172, 3, 64),
(173, 3, 65),
(174, 3, 66),
(175, 3, 67),
(176, 3, 68),
(177, 3, 69),
(178, 3, 70),
(179, 3, 71),
(180, 3, 72),
(181, 3, 73),
(182, 3, 74),
(183, 3, 75),
(184, 3, 76),
(185, 3, 77),
(186, 3, 78),
(187, 3, 79),
(188, 3, 80),
(189, 3, 81),
(190, 3, 82),
(191, 3, 83),
(192, 3, 84);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add detalle solicitud', 7, 'add_detallesolicitud'),
(26, 'Can change detalle solicitud', 7, 'change_detallesolicitud'),
(27, 'Can delete detalle solicitud', 7, 'delete_detallesolicitud'),
(28, 'Can view detalle solicitud', 7, 'view_detallesolicitud'),
(29, 'Can add elemento', 8, 'add_elemento'),
(30, 'Can change elemento', 8, 'change_elemento'),
(31, 'Can delete elemento', 8, 'delete_elemento'),
(32, 'Can view elemento', 8, 'view_elemento'),
(33, 'Can add estado mantenimiento', 9, 'add_estadomantenimiento'),
(34, 'Can change estado mantenimiento', 9, 'change_estadomantenimiento'),
(35, 'Can delete estado mantenimiento', 9, 'delete_estadomantenimiento'),
(36, 'Can view estado mantenimiento', 9, 'view_estadomantenimiento'),
(37, 'Can add ficha', 10, 'add_ficha'),
(38, 'Can change ficha', 10, 'change_ficha'),
(39, 'Can delete ficha', 10, 'delete_ficha'),
(40, 'Can view ficha', 10, 'view_ficha'),
(41, 'Can add proveedor', 11, 'add_proveedor'),
(42, 'Can change proveedor', 11, 'change_proveedor'),
(43, 'Can delete proveedor', 11, 'delete_proveedor'),
(44, 'Can view proveedor', 11, 'view_proveedor'),
(45, 'Can add unidad medida', 12, 'add_unidadmedida'),
(46, 'Can change unidad medida', 12, 'change_unidadmedida'),
(47, 'Can delete unidad medida', 12, 'delete_unidadmedida'),
(48, 'Can view unidad medida', 12, 'view_unidadmedida'),
(49, 'Can add ubicacion fisica', 13, 'add_ubicacionfisica'),
(50, 'Can change ubicacion fisica', 13, 'change_ubicacionfisica'),
(51, 'Can delete ubicacion fisica', 13, 'delete_ubicacionfisica'),
(52, 'Can view ubicacion fisica', 13, 'view_ubicacionfisica'),
(53, 'Can add solicitud elemento', 14, 'add_solicitudelemento'),
(54, 'Can change solicitud elemento', 14, 'change_solicitudelemento'),
(55, 'Can delete solicitud elemento', 14, 'delete_solicitudelemento'),
(56, 'Can view solicitud elemento', 14, 'view_solicitudelemento'),
(57, 'Can add salida detalle solicitud', 15, 'add_salidadetallesolicitud'),
(58, 'Can change salida detalle solicitud', 15, 'change_salidadetallesolicitud'),
(59, 'Can delete salida detalle solicitud', 15, 'delete_salidadetallesolicitud'),
(60, 'Can view salida detalle solicitud', 15, 'view_salidadetallesolicitud'),
(61, 'Can add material', 16, 'add_material'),
(62, 'Can change material', 16, 'change_material'),
(63, 'Can delete material', 16, 'delete_material'),
(64, 'Can view material', 16, 'view_material'),
(65, 'Can add mantenimento', 17, 'add_mantenimento'),
(66, 'Can change mantenimento', 17, 'change_mantenimento'),
(67, 'Can delete mantenimento', 17, 'delete_mantenimento'),
(68, 'Can view mantenimento', 17, 'view_mantenimento'),
(69, 'Can add entrada material', 18, 'add_entradamaterial'),
(70, 'Can change entrada material', 18, 'change_entradamaterial'),
(71, 'Can delete entrada material', 18, 'delete_entradamaterial'),
(72, 'Can view entrada material', 18, 'view_entradamaterial'),
(73, 'Can add devolutivo', 19, 'add_devolutivo'),
(74, 'Can change devolutivo', 19, 'change_devolutivo'),
(75, 'Can delete devolutivo', 19, 'delete_devolutivo'),
(76, 'Can view devolutivo', 19, 'view_devolutivo'),
(77, 'Can add devolucion elemento', 20, 'add_devolucionelemento'),
(78, 'Can change devolucion elemento', 20, 'change_devolucionelemento'),
(79, 'Can delete devolucion elemento', 20, 'delete_devolucionelemento'),
(80, 'Can view devolucion elemento', 20, 'view_devolucionelemento'),
(81, 'Can add detalle entrada material', 21, 'add_detalleentradamaterial'),
(82, 'Can change detalle entrada material', 21, 'change_detalleentradamaterial'),
(83, 'Can delete detalle entrada material', 21, 'delete_detalleentradamaterial'),
(84, 'Can view detalle entrada material', 21, 'view_detalleentradamaterial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-05-04 15:30:50.124011', '1', 'Administrador', 1, '[{\"added\": {}}]', 3, 1),
(2, '2023-05-04 15:31:33.660325', '2', 'Asistente', 1, '[{\"added\": {}}]', 3, 1),
(3, '2023-05-04 15:32:01.607920', '3', 'Instructor', 1, '[{\"added\": {}}]', 3, 1),
(4, '2023-05-15 12:32:47.830440', '2', 'kmurillo', 1, '[{\"added\": {}}]', 6, 1),
(5, '2023-05-15 12:38:05.618184', '3', 'ccuellar', 1, '[{\"added\": {}}]', 6, 1),
(6, '2023-05-15 12:52:55.415580', '4', 'StivenM', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 4),
(7, '2023-05-15 13:14:07.147812', '2', 'kmurillo', 3, '', 6, 4),
(8, '2023-05-15 13:14:17.636031', '4', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 6, 4),
(9, '2023-05-15 13:21:25.179646', '4', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 4),
(10, '2023-05-15 13:22:44.714174', '4', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"UserTipo\"]}}]', 6, 4),
(11, '2023-05-15 15:18:08.598062', '4', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 4),
(12, '2023-05-15 15:37:56.358347', '5', 'nataliaandreasotolongas@gmail.com', 2, '[]', 6, 1),
(13, '2023-05-15 15:42:25.760796', '4', 'KevinM', 2, '[]', 6, 1),
(14, '2023-05-15 15:42:31.678436', '5', 'nataliaandreasotolongas@gmail.com', 3, '', 6, 1),
(15, '2023-05-15 16:12:09.449333', '7', 'kevinstivenmurillo1906@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 1),
(16, '2023-05-18 14:28:47.914863', '4', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 4),
(17, '2023-05-18 15:27:11.363338', '4', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 4),
(18, '2023-05-18 15:29:34.081313', '4', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 4),
(19, '2023-05-18 15:31:34.268479', '4', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 1),
(20, '2023-05-18 15:45:46.385574', '7', 'kevinstivenmurillo1906@gmail.com', 3, '', 6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(21, 'appGestionInventario', 'detalleentradamaterial'),
(7, 'appGestionInventario', 'detallesolicitud'),
(20, 'appGestionInventario', 'devolucionelemento'),
(19, 'appGestionInventario', 'devolutivo'),
(8, 'appGestionInventario', 'elemento'),
(18, 'appGestionInventario', 'entradamaterial'),
(9, 'appGestionInventario', 'estadomantenimiento'),
(10, 'appGestionInventario', 'ficha'),
(17, 'appGestionInventario', 'mantenimento'),
(16, 'appGestionInventario', 'material'),
(11, 'appGestionInventario', 'proveedor'),
(15, 'appGestionInventario', 'salidadetallesolicitud'),
(14, 'appGestionInventario', 'solicitudelemento'),
(13, 'appGestionInventario', 'ubicacionfisica'),
(12, 'appGestionInventario', 'unidadmedida'),
(6, 'appGestionInventario', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-04 15:17:29.325109'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-05-04 15:17:29.363707'),
(3, 'auth', '0001_initial', '2023-05-04 15:17:29.494933'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-05-04 15:17:29.527875'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-05-04 15:17:29.531896'),
(6, 'auth', '0004_alter_user_username_opts', '2023-05-04 15:17:29.535854'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-05-04 15:17:29.540841'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-05-04 15:17:29.542835'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-05-04 15:17:29.546851'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-05-04 15:17:29.550806'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-05-04 15:17:29.555768'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-05-04 15:17:29.592142'),
(13, 'auth', '0011_update_proxy_permissions', '2023-05-04 15:17:29.597129'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-05-04 15:17:29.601128'),
(15, 'appGestionInventario', '0001_initial', '2023-05-04 15:17:30.529826'),
(16, 'admin', '0001_initial', '2023-05-04 15:17:30.600250'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-05-04 15:17:30.608198'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-04 15:17:30.617095'),
(19, 'sessions', '0001_initial', '2023-05-04 15:17:30.636894');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hzey3c6ot6vsewj09hqi6oqs53nenw0o', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kmAGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2JlJdvrdEuAjtx3QHdqtc-xtXebEd4UfdPBrp_y8HO7fQYVRv_UUAAmzS-CkQwqT8GRDSZLAgU5aW1AERRuvMAmfpbHOIJmswIkSLHt_AArXOJY:1puaqx:VHECrvrIVqCZ6--lAUYJJ0Ys11dvqZ1_4j3-BGPqHk0', '2023-05-18 15:26:43.402538'),
('wwe1dtd61ld9o7dxnudbmrnc3g5cqhqz', '.eJxVjMsOwiAQAP-FsyG8ZLsevfsNZBeoVA1NSnsy_rsl6UGvM5N5i0DbWsLW8hKmJC5iEKdfxhSfuXaRHlTvs4xzXZeJZU_kYZu8zSm_rkf7NyjUSt-yO6fEo6KEAAa0GqzVYNAA7Mih19mRyuwRo0bLgHvApK23pEYtPl_MTzbx:1pzgOZ:C0G2a_Gm6L2w1IVUKFm-LB_WsIuIOc4y6zjtFjZekac', '2023-06-01 16:22:27.363817');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appgestioninventario_detalleentradamaterial`
--
ALTER TABLE `appgestioninventario_detalleentradamaterial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_detEntradaMaterial_i_b849c174_fk_appGestio` (`detEntradaMaterial_id`),
  ADD KEY `appGestionInventario_detMaterial_id_b7da5470_fk_appGestio` (`detMaterial_id`);

--
-- Indices de la tabla `appgestioninventario_detallesolicitud`
--
ALTER TABLE `appgestioninventario_detallesolicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_detElemento_id_c20b8c3f_fk_appGestio` (`detElemento_id`),
  ADD KEY `appGestionInventario_detSolicitud_id_e2077e95_fk_appGestio` (`detSolicitud_id`),
  ADD KEY `appGestionInventario_detUnidadMedida_id_7fd9c67a_fk_appGestio` (`detUnidadMedida_id`);

--
-- Indices de la tabla `appgestioninventario_devolucionelemento`
--
ALTER TABLE `appgestioninventario_devolucionelemento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_devSalida_id_1a1b85f5_fk_appGestio` (`devSalida_id`),
  ADD KEY `appGestionInventario_devUsuario_id_2810a484_fk_appGestio` (`devUsuario_id`);

--
-- Indices de la tabla `appgestioninventario_devolutivo`
--
ALTER TABLE `appgestioninventario_devolutivo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `devPlacaSena` (`devPlacaSena`),
  ADD KEY `appGestionInventario_devElemento_id_d3dd6c96_fk_appGestio` (`devElemento_id`);

--
-- Indices de la tabla `appgestioninventario_elemento`
--
ALTER TABLE `appgestioninventario_elemento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eleCodigo` (`eleCodigo`);

--
-- Indices de la tabla `appgestioninventario_entradamaterial`
--
ALTER TABLE `appgestioninventario_entradamaterial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_entProveedor_id_ebe3f53d_fk_appGestio` (`entProveedor_id`),
  ADD KEY `appGestionInventario_entUsuarioRecibe_id_a1347ef1_fk_appGestio` (`entUsuarioRecibe_id`);

--
-- Indices de la tabla `appgestioninventario_estadomantenimiento`
--
ALTER TABLE `appgestioninventario_estadomantenimiento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estNombre` (`estNombre`);

--
-- Indices de la tabla `appgestioninventario_ficha`
--
ALTER TABLE `appgestioninventario_ficha`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ficCodigo` (`ficCodigo`);

--
-- Indices de la tabla `appgestioninventario_mantenimento`
--
ALTER TABLE `appgestioninventario_mantenimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_manElemento_id_fe8cdab4_fk_appGestio` (`manElemento_id`),
  ADD KEY `appGestionInventario_manEstado_id_eb11f76b_fk_appGestio` (`manEstado_id`),
  ADD KEY `appGestionInventario_manUsuario_id_7ba78625_fk_appGestio` (`manUsuario_id`);

--
-- Indices de la tabla `appgestioninventario_material`
--
ALTER TABLE `appgestioninventario_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_matElemento_id_a0483d69_fk_appGestio` (`matElemento_id`),
  ADD KEY `appGestionInventario_matUnidadMedida_id_204d069c_fk_appGestio` (`matUnidadMedida_id`);

--
-- Indices de la tabla `appgestioninventario_proveedor`
--
ALTER TABLE `appgestioninventario_proveedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proIdentificacion` (`proIdentificacion`);

--
-- Indices de la tabla `appgestioninventario_salidadetallesolicitud`
--
ALTER TABLE `appgestioninventario_salidadetallesolicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_salDetalleSolicitud__3983d06e_fk_appGestio` (`salDetalleSolicitud_id`);

--
-- Indices de la tabla `appgestioninventario_solicitudelemento`
--
ALTER TABLE `appgestioninventario_solicitudelemento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_solFicha_id_a0b27756_fk_appGestio` (`solFicha_id`),
  ADD KEY `appGestionInventario_solUsuario_id_72e8054b_fk_appGestio` (`solUsuario_id`);

--
-- Indices de la tabla `appgestioninventario_ubicacionfisica`
--
ALTER TABLE `appgestioninventario_ubicacionfisica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_ubiElemento_id_2d2d9b6e_fk_appGestio` (`ubiElemento_id`);

--
-- Indices de la tabla `appgestioninventario_unidadmedida`
--
ALTER TABLE `appgestioninventario_unidadmedida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniNombre` (`uniNombre`);

--
-- Indices de la tabla `appgestioninventario_user`
--
ALTER TABLE `appgestioninventario_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `appgestioninventario_user_groups`
--
ALTER TABLE `appgestioninventario_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appGestionInventario_user_groups_user_id_group_id_84dd0188_uniq` (`user_id`,`group_id`),
  ADD KEY `appGestionInventario_group_id_b9a16238_fk_auth_grou` (`group_id`);

--
-- Indices de la tabla `appgestioninventario_user_user_permissions`
--
ALTER TABLE `appgestioninventario_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appGestionInventario_use_user_id_permission_id_63157aae_uniq` (`user_id`,`permission_id`),
  ADD KEY `appGestionInventario_permission_id_37a3a8c5_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_appGestio` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_detalleentradamaterial`
--
ALTER TABLE `appgestioninventario_detalleentradamaterial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_detallesolicitud`
--
ALTER TABLE `appgestioninventario_detallesolicitud`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_devolucionelemento`
--
ALTER TABLE `appgestioninventario_devolucionelemento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_devolutivo`
--
ALTER TABLE `appgestioninventario_devolutivo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_elemento`
--
ALTER TABLE `appgestioninventario_elemento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_entradamaterial`
--
ALTER TABLE `appgestioninventario_entradamaterial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_estadomantenimiento`
--
ALTER TABLE `appgestioninventario_estadomantenimiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_ficha`
--
ALTER TABLE `appgestioninventario_ficha`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_mantenimento`
--
ALTER TABLE `appgestioninventario_mantenimento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_material`
--
ALTER TABLE `appgestioninventario_material`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_proveedor`
--
ALTER TABLE `appgestioninventario_proveedor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_salidadetallesolicitud`
--
ALTER TABLE `appgestioninventario_salidadetallesolicitud`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_solicitudelemento`
--
ALTER TABLE `appgestioninventario_solicitudelemento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_ubicacionfisica`
--
ALTER TABLE `appgestioninventario_ubicacionfisica`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_unidadmedida`
--
ALTER TABLE `appgestioninventario_unidadmedida`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_user`
--
ALTER TABLE `appgestioninventario_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_user_groups`
--
ALTER TABLE `appgestioninventario_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_user_user_permissions`
--
ALTER TABLE `appgestioninventario_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appgestioninventario_detalleentradamaterial`
--
ALTER TABLE `appgestioninventario_detalleentradamaterial`
  ADD CONSTRAINT `appGestionInventario_detEntradaMaterial_i_b849c174_fk_appGestio` FOREIGN KEY (`detEntradaMaterial_id`) REFERENCES `appgestioninventario_entradamaterial` (`id`),
  ADD CONSTRAINT `appGestionInventario_detMaterial_id_b7da5470_fk_appGestio` FOREIGN KEY (`detMaterial_id`) REFERENCES `appgestioninventario_material` (`id`);

--
-- Filtros para la tabla `appgestioninventario_detallesolicitud`
--
ALTER TABLE `appgestioninventario_detallesolicitud`
  ADD CONSTRAINT `appGestionInventario_detElemento_id_c20b8c3f_fk_appGestio` FOREIGN KEY (`detElemento_id`) REFERENCES `appgestioninventario_elemento` (`id`),
  ADD CONSTRAINT `appGestionInventario_detSolicitud_id_e2077e95_fk_appGestio` FOREIGN KEY (`detSolicitud_id`) REFERENCES `appgestioninventario_solicitudelemento` (`id`),
  ADD CONSTRAINT `appGestionInventario_detUnidadMedida_id_7fd9c67a_fk_appGestio` FOREIGN KEY (`detUnidadMedida_id`) REFERENCES `appgestioninventario_unidadmedida` (`id`);

--
-- Filtros para la tabla `appgestioninventario_devolucionelemento`
--
ALTER TABLE `appgestioninventario_devolucionelemento`
  ADD CONSTRAINT `appGestionInventario_devSalida_id_1a1b85f5_fk_appGestio` FOREIGN KEY (`devSalida_id`) REFERENCES `appgestioninventario_salidadetallesolicitud` (`id`),
  ADD CONSTRAINT `appGestionInventario_devUsuario_id_2810a484_fk_appGestio` FOREIGN KEY (`devUsuario_id`) REFERENCES `appgestioninventario_user` (`id`);

--
-- Filtros para la tabla `appgestioninventario_devolutivo`
--
ALTER TABLE `appgestioninventario_devolutivo`
  ADD CONSTRAINT `appGestionInventario_devElemento_id_d3dd6c96_fk_appGestio` FOREIGN KEY (`devElemento_id`) REFERENCES `appgestioninventario_elemento` (`id`);

--
-- Filtros para la tabla `appgestioninventario_entradamaterial`
--
ALTER TABLE `appgestioninventario_entradamaterial`
  ADD CONSTRAINT `appGestionInventario_entProveedor_id_ebe3f53d_fk_appGestio` FOREIGN KEY (`entProveedor_id`) REFERENCES `appgestioninventario_proveedor` (`id`),
  ADD CONSTRAINT `appGestionInventario_entUsuarioRecibe_id_a1347ef1_fk_appGestio` FOREIGN KEY (`entUsuarioRecibe_id`) REFERENCES `appgestioninventario_user` (`id`);

--
-- Filtros para la tabla `appgestioninventario_mantenimento`
--
ALTER TABLE `appgestioninventario_mantenimento`
  ADD CONSTRAINT `appGestionInventario_manElemento_id_fe8cdab4_fk_appGestio` FOREIGN KEY (`manElemento_id`) REFERENCES `appgestioninventario_elemento` (`id`),
  ADD CONSTRAINT `appGestionInventario_manEstado_id_eb11f76b_fk_appGestio` FOREIGN KEY (`manEstado_id`) REFERENCES `appgestioninventario_estadomantenimiento` (`id`),
  ADD CONSTRAINT `appGestionInventario_manUsuario_id_7ba78625_fk_appGestio` FOREIGN KEY (`manUsuario_id`) REFERENCES `appgestioninventario_user` (`id`);

--
-- Filtros para la tabla `appgestioninventario_material`
--
ALTER TABLE `appgestioninventario_material`
  ADD CONSTRAINT `appGestionInventario_matElemento_id_a0483d69_fk_appGestio` FOREIGN KEY (`matElemento_id`) REFERENCES `appgestioninventario_elemento` (`id`),
  ADD CONSTRAINT `appGestionInventario_matUnidadMedida_id_204d069c_fk_appGestio` FOREIGN KEY (`matUnidadMedida_id`) REFERENCES `appgestioninventario_unidadmedida` (`id`);

--
-- Filtros para la tabla `appgestioninventario_salidadetallesolicitud`
--
ALTER TABLE `appgestioninventario_salidadetallesolicitud`
  ADD CONSTRAINT `appGestionInventario_salDetalleSolicitud__3983d06e_fk_appGestio` FOREIGN KEY (`salDetalleSolicitud_id`) REFERENCES `appgestioninventario_detallesolicitud` (`id`);

--
-- Filtros para la tabla `appgestioninventario_solicitudelemento`
--
ALTER TABLE `appgestioninventario_solicitudelemento`
  ADD CONSTRAINT `appGestionInventario_solFicha_id_a0b27756_fk_appGestio` FOREIGN KEY (`solFicha_id`) REFERENCES `appgestioninventario_ficha` (`id`),
  ADD CONSTRAINT `appGestionInventario_solUsuario_id_72e8054b_fk_appGestio` FOREIGN KEY (`solUsuario_id`) REFERENCES `appgestioninventario_user` (`id`);

--
-- Filtros para la tabla `appgestioninventario_ubicacionfisica`
--
ALTER TABLE `appgestioninventario_ubicacionfisica`
  ADD CONSTRAINT `appGestionInventario_ubiElemento_id_2d2d9b6e_fk_appGestio` FOREIGN KEY (`ubiElemento_id`) REFERENCES `appgestioninventario_elemento` (`id`);

--
-- Filtros para la tabla `appgestioninventario_user_groups`
--
ALTER TABLE `appgestioninventario_user_groups`
  ADD CONSTRAINT `appGestionInventario_group_id_b9a16238_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `appGestionInventario_user_id_8cf06a1f_fk_appGestio` FOREIGN KEY (`user_id`) REFERENCES `appgestioninventario_user` (`id`);

--
-- Filtros para la tabla `appgestioninventario_user_user_permissions`
--
ALTER TABLE `appgestioninventario_user_user_permissions`
  ADD CONSTRAINT `appGestionInventario_permission_id_37a3a8c5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `appGestionInventario_user_id_cb412637_fk_appGestio` FOREIGN KEY (`user_id`) REFERENCES `appgestioninventario_user` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_appGestio` FOREIGN KEY (`user_id`) REFERENCES `appgestioninventario_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
