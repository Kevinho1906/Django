-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2023 a las 17:56:51
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
  `detEstado` varchar(7) NOT NULL COMMENT 'estado del Elemento',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `detEntradaMaterial_id` bigint(20) NOT NULL COMMENT 'Hace referencia a la Entrada registrada',
  `detMaterial_id` bigint(20) NOT NULL COMMENT 'Hace referencia al material que se está registrando en la entrada',
  `detUnidadMedida_id` bigint(20) NOT NULL COMMENT 'Hace referencia a la Unidad de Medida FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `appgestioninventario_detalleentradamaterial`
--

INSERT INTO `appgestioninventario_detalleentradamaterial` (`id`, `detCantidad`, `detPrecioUnitario`, `detEstado`, `fechaHoraCreacion`, `fechaHoraActualizacion`, `detEntradaMaterial_id`, `detMaterial_id`, `detUnidadMedida_id`) VALUES
(1, 1, 2500000, 'Regular', '2023-05-29 15:44:56.578910', '2023-05-29 15:44:56.578910', 12, 8, 1),
(2, 1, 200000, 'Bueno', '2023-05-29 15:48:52.690617', '2023-05-29 15:48:52.690617', 13, 8, 4),
(3, 1, 200000, 'Bueno', '2023-05-29 15:48:59.336423', '2023-05-29 15:48:59.336423', 14, 8, 4),
(4, 3, 20000, 'Bueno', '2023-05-29 15:52:00.016729', '2023-05-29 15:52:00.016729', 15, 8, 4),
(5, 3, 20000, 'Bueno', '2023-05-29 15:52:05.864125', '2023-05-29 15:52:05.864125', 16, 8, 4);

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
(1, 'dfgfhggh', '123', 'Bien', 'Samsumg', '2023-05-24', '2500000.00', 'elementos/logo_contruc.png', '2023-05-29 15:06:41.267732', '2023-05-29 15:06:41.268739', 10);

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
(1, 'MAT000001', 'Cables', 'MAT', 'Bueno', '2023-05-18 23:04:04.435220', '2023-05-18 23:04:04.435220'),
(2, 'MAT000002', 'Tubos pvc', 'MAT', 'Bueno', '2023-05-18 23:33:46.827435', '2023-05-18 23:33:46.827435'),
(3, 'MAT000003', 'Nevera', 'MAT', 'Bueno', '2023-05-19 00:54:36.332036', '2023-05-19 00:54:36.332036'),
(4, 'MAT000004', 'd3d3d33dqadadadd', 'MAT', 'Bueno', '2023-05-19 00:55:58.828779', '2023-05-19 00:55:58.828779'),
(5, 'MAT000005', 'Cables', 'MAT', 'Bueno', '2023-05-19 01:05:22.922131', '2023-05-19 01:05:22.923124'),
(6, 'MAT000006', 'Televisor', 'MAT', 'Bueno', '2023-05-19 01:12:01.626225', '2023-05-19 01:12:01.626225'),
(7, 'MAT000007', 'zapato', 'MAT', 'Bueno', '2023-05-19 01:16:11.148707', '2023-05-19 01:16:11.148707'),
(8, 'MAT000008', 'Cemento', 'MAT', 'Bueno', '2023-05-25 15:12:50.115662', '2023-05-25 15:12:50.115662'),
(9, 'MAT000009', 'Celular', 'MAT', 'Bueno', '2023-05-29 15:02:19.454584', '2023-05-29 15:02:19.454584'),
(10, 'EQU00010', 'Celular', 'EQU', 'Bueno', '2023-05-29 15:06:39.907985', '2023-05-29 15:06:39.907985');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestioninventario_entradamaterial`
--

CREATE TABLE `appgestioninventario_entradamaterial` (
  `id` bigint(20) NOT NULL,
  `entNumeroFactura` varchar(15) NOT NULL COMMENT 'Numero de la factura',
  `entFechaHora` datetime(6) NOT NULL COMMENT 'Fecha y hora que entregan los elementos',
  `entEntregadoPor` varchar(101) NOT NULL COMMENT 'Nombre persona que entrega los materiales',
  `entObservaciones` longtext DEFAULT NULL COMMENT 'Observaciones que se requieran hacer',
  `fechaHoraCreacion` datetime(6) NOT NULL COMMENT 'Fecha y hora del registro',
  `fechaHoraActualizacion` datetime(6) NOT NULL COMMENT 'Fecha y hora última actualización',
  `entProveedor_id` bigint(20) NOT NULL COMMENT 'Hace referencia al proveedor que entrea los materiales',
  `entUsuarioRecibe_id` bigint(20) NOT NULL COMMENT 'Hace referencia a usuario de construcción que recibe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `appgestioninventario_entradamaterial`
--

INSERT INTO `appgestioninventario_entradamaterial` (`id`, `entNumeroFactura`, `entFechaHora`, `entEntregadoPor`, `entObservaciones`, `fechaHoraCreacion`, `fechaHoraActualizacion`, `entProveedor_id`, `entUsuarioRecibe_id`) VALUES
(12, '1', '2023-05-29 05:00:00.000000', 'Kevin', '', '2023-05-29 15:44:56.571899', '2023-05-29 15:44:56.571899', 1, 3),
(13, '1', '2023-05-29 05:00:00.000000', 'fdvvd', '', '2023-05-29 15:48:52.681507', '2023-05-29 15:48:52.681507', 1, 3),
(14, '1', '2023-05-29 05:00:00.000000', 'fdvvd', '', '2023-05-29 15:48:59.329440', '2023-05-29 15:48:59.329440', 1, 3),
(15, '3', '2023-05-29 05:00:00.000000', 'Kevin', '', '2023-05-29 15:52:00.007778', '2023-05-29 15:52:00.007778', 1, 3),
(16, '3', '2023-05-29 05:00:00.000000', 'Kevin', '', '2023-05-29 15:52:05.857176', '2023-05-29 15:52:05.857176', 1, 3);

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
  `matElemento_id` bigint(20) NOT NULL COMMENT 'Hace referencia al Elemento FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `appgestioninventario_material`
--

INSERT INTO `appgestioninventario_material` (`id`, `matReferencia`, `matMarca`, `fechaHoraCreacion`, `fechaHoraActualizacion`, `matElemento_id`) VALUES
(8, 'Cemento del fino ', 'Argos', '2023-05-25 15:12:50.117671', '2023-05-25 15:12:50.117671', 8),
(9, 'Bien', 'Samsumg', '2023-05-29 15:02:19.455581', '2023-05-29 15:02:19.455581', 9);

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

--
-- Volcado de datos para la tabla `appgestioninventario_proveedor`
--

INSERT INTO `appgestioninventario_proveedor` (`id`, `proTipo`, `proIdentificacion`, `proNombre`, `proRepresentanteLegal`, `proTelefono`, `fechaHoraCreacion`, `fechaHoraActualizacion`) VALUES
(1, 'Persona Natural', '1002131414', 'SurtiElectrico', 'Carlos', '313131313', '2023-05-18 22:56:02.279921', '2023-05-18 22:56:02.279921');

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
(1, 1, 0, 0, 0, '2023-05-18 23:04:04.437220', '2023-05-18 23:04:04.437220', 1),
(2, 1, 0, 0, 0, '2023-05-18 23:33:46.831449', '2023-05-18 23:33:46.831449', 2),
(3, 1, 0, 0, 0, '2023-05-19 00:54:36.334037', '2023-05-19 00:54:36.334037', 3),
(4, 1, 1, 0, 1, '2023-05-19 00:55:58.834774', '2023-05-19 00:55:58.834774', 4),
(5, 1, 0, 0, 0, '2023-05-19 01:05:22.925159', '2023-05-19 01:05:22.925159', 5),
(6, 1, 0, 0, 0, '2023-05-19 01:12:01.629944', '2023-05-19 01:12:01.629944', 6),
(7, 1, 0, 0, 0, '2023-05-19 01:16:11.150713', '2023-05-19 01:16:11.150713', 7),
(8, 1, 3, 0, 3, '2023-05-25 15:12:50.118668', '2023-05-25 15:12:50.118668', 8),
(9, 3, 3, 0, 4, '2023-05-29 15:02:19.456578', '2023-05-29 15:02:19.456578', 9),
(10, 1, 2, 3, 4, '2023-05-29 15:06:39.909007', '2023-05-29 15:06:39.909007', 10);

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

--
-- Volcado de datos para la tabla `appgestioninventario_unidadmedida`
--

INSERT INTO `appgestioninventario_unidadmedida` (`id`, `uniNombre`, `fechaHoraCreacion`, `fechaHoraActualizacion`) VALUES
(1, 'Kilos', '2023-05-18 22:56:25.460716', '2023-05-18 22:56:25.460716'),
(2, 'Galon', '2023-05-18 22:56:32.178270', '2023-05-18 22:56:32.178270'),
(3, 'Litros', '2023-05-18 22:56:36.667487', '2023-05-18 22:56:36.667487'),
(4, 'Bultos', '2023-05-18 22:57:01.491562', '2023-05-18 22:57:01.491562');

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
(2, 'pbkdf2_sha256$600000$PH9RJoWDrJq9TIYDB5d3PF$qmNam1Nwm8M84uQpkhmALb8TV7PpyznVxrtAyjrJUFY=', '2023-05-29 14:53:56.708538', 1, 'KevinM', '', '', 'kevinmurillobetancourt@gmail.com', 1, 1, '2023-05-29 14:52:36.000000', '', 'Administrativo', '2023-05-29 14:52:36.850245', '2023-05-29 14:53:37.172946'),
(3, 'pbkdf2_sha256$600000$cufpgdYNpxb4kzVZrN8iLr$qa1dWrUXZkpXm7vPuD5i+tgDN+exuFb06y0fI9B+6XA=', '2023-05-29 15:35:14.099299', 0, 'kevinstivenmurillo1906@gmail.com', 'Kevin', 'Murillo', 'kevinstivenmurillo1906@gmail.com', 0, 1, '2023-05-29 14:54:32.112869', 'fotos/logo_contruc_Yolz9oo.png', 'Aprendiz', '2023-05-29 14:54:32.133706', '2023-05-29 14:54:32.428866');

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
(4, 2, 1),
(5, 3, 2);

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
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60),
(61, 1, 61),
(62, 1, 62),
(63, 1, 63),
(64, 1, 64),
(65, 1, 65),
(66, 1, 66),
(67, 1, 67),
(68, 1, 68),
(69, 1, 69),
(70, 1, 70),
(71, 1, 71),
(72, 1, 72),
(73, 1, 73),
(74, 1, 74),
(75, 1, 75),
(76, 1, 76),
(77, 1, 77),
(78, 1, 78),
(79, 1, 79),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(84, 1, 84);

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
(13, '2023-05-29 14:53:29.160748', '1', 'Steven', 3, '', 6, 2),
(14, '2023-05-29 14:53:37.182123', '2', 'KevinM', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"UserTipo\"]}}]', 6, 2);

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
(1, 'contenttypes', '0001_initial', '2023-05-18 22:51:45.678016'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-05-18 22:51:45.726536'),
(3, 'auth', '0001_initial', '2023-05-18 22:51:45.898453'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-05-18 22:51:45.938141'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-05-18 22:51:45.944137'),
(6, 'auth', '0004_alter_user_username_opts', '2023-05-18 22:51:45.949135'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-05-18 22:51:45.954140'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-05-18 22:51:45.958147'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-05-18 22:51:45.962591'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-05-18 22:51:45.969601'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-05-18 22:51:45.974608'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-05-18 22:51:46.035046'),
(13, 'auth', '0011_update_proxy_permissions', '2023-05-18 22:51:46.042042'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-05-18 22:51:46.047042'),
(15, 'appGestionInventario', '0001_initial', '2023-05-18 22:51:47.293674'),
(16, 'admin', '0001_initial', '2023-05-18 22:51:47.407283'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-05-18 22:51:47.415277'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-18 22:51:47.425289'),
(19, 'sessions', '0001_initial', '2023-05-18 22:51:47.450029');

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
('6fe32ei5w3h3usez88rtfyhtilio936h', '.eJxVjMsOwiAQRf-FtSEw5enSvd9AhgGkaiAp7cr479qkC93ec859sYDbWsM28hLmxM5MstPvFpEeue0g3bHdOqfe1mWOfFf4QQe_9pSfl8P9O6g46rc2UheyRWbpnRHCY0Khi7IxR180Ti6lSNYAaAeADsxkETyCIpUlOWLvD-LAN9M:1pzoYC:J8PF3Yu4UsUCiBJgVll-ByIehAkxeX6dcSvsUvCW2zo', '2023-06-02 01:04:56.401110'),
('9ldeizfxj67acjv90xq7t8gv1mu4q0hf', '.eJxVjMsOwiAQRf-FtSEw5enSvd9AhgGkaiAp7cr479qkC93ec859sYDbWsM28hLmxM5MstPvFpEeue0g3bHdOqfe1mWOfFf4QQe_9pSfl8P9O6g46rc2UheyRWbpnRHCY0Khi7IxR180Ti6lSNYAaAeADsxkETyCIpUlOWLvD-LAN9M:1q1w8j:wnHAtLHoPuf1Cd9Mer19LcR-6trrzc9agOJ-hXbr_qY', '2023-06-07 21:35:25.320243'),
('k3y95pzxsyrfrf9s886ws0mtz19pgd29', '.eJxVjMsOwiAQRf-FtSEw5enSvd9AhgGkaiAp7cr479qkC93ec859sYDbWsM28hLmxM5MstPvFpEeue0g3bHdOqfe1mWOfFf4QQe_9pSfl8P9O6g46rc2UheyRWbpnRHCY0Khi7IxR180Ti6lSNYAaAeADsxkETyCIpUlOWLvD-LAN9M:1q2L2V:AVVHygX0liddF_A9Wy_fN3m8s5WviMNFU9GWTC3TDn4', '2023-06-09 00:10:39.434656'),
('kxpsxl45493xlszyysh4f1zwkk94uzcm', '.eJxVjEEOwiAQRe_C2hCBUsCl-56BDMyMVA0kpV0Z765NutDtf-_9l4iwrSVunZY4o7gII06_W4L8oLoDvEO9NZlbXZc5yV2RB-1yakjP6-H-HRTo5VszWT8wWwXJcdLBO-MVAigIesAwWuKAgx0zozLWaPYUss_gCNiSOov3B_5yOK8:1q3etu:NO8c1KvSFB-lc_uVHfEXBWR-zICeTqoEwaNbTk6TuR4', '2023-06-12 15:35:14.113261'),
('mjq5oysgcdst1fgtaufifykf72209pbs', '.eJxVjMsOwiAQRf-FtSEw5enSvd9AhgGkaiAp7cr479qkC93ec859sYDbWsM28hLmxM5MstPvFpEeue0g3bHdOqfe1mWOfFf4QQe_9pSfl8P9O6g46rc2UheyRWbpnRHCY0Khi7IxR180Ti6lSNYAaAeADsxkETyCIpUlOWLvD-LAN9M:1q2CHL:drG7fZf8zh-vAuU9wqrqCoPtT8kCZgsHH09ccQiovRQ', '2023-06-08 14:49:23.497523');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appgestioninventario_detalleentradamaterial`
--
ALTER TABLE `appgestioninventario_detalleentradamaterial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appGestionInventario_detEntradaMaterial_i_b849c174_fk_appGestio` (`detEntradaMaterial_id`),
  ADD KEY `appGestionInventario_detMaterial_id_b7da5470_fk_appGestio` (`detMaterial_id`),
  ADD KEY `appGestionInventario_matUnidadMedida_id_309ac68c_fk_appGestio` (`detUnidadMedida_id`);

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
  ADD KEY `appGestionInventario_matElemento_id_a0483d69_fk_appGestio` (`matElemento_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_entradamaterial`
--
ALTER TABLE `appgestioninventario_entradamaterial`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_proveedor`
--
ALTER TABLE `appgestioninventario_proveedor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_unidadmedida`
--
ALTER TABLE `appgestioninventario_unidadmedida`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_user`
--
ALTER TABLE `appgestioninventario_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `appgestioninventario_user_groups`
--
ALTER TABLE `appgestioninventario_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  ADD CONSTRAINT `appGestionInventario_detMaterial_id_b7da5470_fk_appGestio` FOREIGN KEY (`detMaterial_id`) REFERENCES `appgestioninventario_material` (`id`),
  ADD CONSTRAINT `appGestionInventario_matUnidadMedida_id_309ac68c_fk_appGestio` FOREIGN KEY (`detUnidadMedida_id`) REFERENCES `appgestioninventario_unidadmedida` (`id`);

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
  ADD CONSTRAINT `appGestionInventario_matElemento_id_a0483d69_fk_appGestio` FOREIGN KEY (`matElemento_id`) REFERENCES `appgestioninventario_elemento` (`id`);

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
