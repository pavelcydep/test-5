-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 22 2023 г., 15:57
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `product_bd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `delivery_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `cost` bigint(11) NOT NULL,
  `quantity` bigint(11) NOT NULL,
  `date` date DEFAULT NULL,
  `price` decimal(20,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `delivery`
--

INSERT INTO `delivery` (`id`, `delivery_number`, `product_id`, `cost`, `quantity`, `date`, `price`) VALUES
(1, '1', 1, 5000, 300, '2021-01-01', '16'),
(2, 't-500', 2, 6000, 10, '2021-01-02', '600'),
(3, '12-TP-777', 3, 500, 100, '2021-01-13', '5'),
(4, '12-TP-778', 3, 300, 50, '2021-01-14', '6'),
(5, '12-TP-779', 3, 539, 77, '2021-01-20', '7'),
(6, '12-TP-877', 3, 176, 32, '2021-01-30', '6'),
(7, '12-TP-977', 3, 554, 94, '2021-02-01', '6');

--
-- Триггеры `delivery`
--
DELIMITER $$
CREATE TRIGGER `update_delivery` AFTER INSERT ON `delivery` FOR EACH ROW BEGIN
   UPDATE product Set name='Колбаса', remainder =10;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remainder` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`product_id`, `name`, `remainder`) VALUES
(1, 'Колбаса', 0),
(2, 'Пармезан', 0),
(3, 'Левый носок', 0);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `sklad`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `sklad` (
`name` varchar(60)
,`product_id` int(11)
,`remains` decimal(41,0)
,`price` decimal(24,4)
);

-- --------------------------------------------------------

--
-- Структура для представления `sklad`
--
DROP TABLE IF EXISTS `sklad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sklad`  AS SELECT `product`.`name` AS `name`, `delivery`.`product_id` AS `product_id`, sum(`delivery`.`quantity`) AS `remains`, avg(`delivery`.`price`) AS `price` FROM (`product` join `delivery` on((`product`.`product_id` = `delivery`.`product_id`))) GROUP BY `product`.`product_id` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
