-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 07 2023 г., 15:58
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `book`
--

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `company` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(32) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `name`, `company`, `phone`, `email`, `birth_date`, `photo`) VALUES
(1, 'Рудницкий Дмитрий Романович', 'Фьюче', '9013634025', 'anipalary@gmail.com', '2002-07-04', 'https://sun9-43.userapi.com/impg/0XuTorEdai5aNXdKqXEfHFcMsIZ2OJIv8273Ow/_71Pi_SGsWE.jpg?size=2560x1920&quality=95&sign=8ee8b0cea5d9f6b308a847ec97e3a60f&type=album'),
(2, 'Кузнецев Василий Пупкин', NULL, '88005553535', 'pupkin@mail.ru', NULL, NULL),
(3, 'Иван Канаев', 'microsoft', '809787654321', 'фырфыр@mail.ru', NULL, 'https://sun1-86.userapi.com/impg/5pYiQE8eG3FFkcf8CCGlLPQmsyMTDJjTIDbThw/MH_J1h_DRHg.jpg?size=607x1080&quality=95&sign=a42a6e6fc73bf18ce269e6d452094082&type=album');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
