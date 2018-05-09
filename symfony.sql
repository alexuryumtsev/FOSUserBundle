-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 09 2018 г., 15:44
-- Версия сервера: 10.1.30-MariaDB
-- Версия PHP: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `symfony`
--

-- --------------------------------------------------------

--
-- Структура таблицы `app_users`
--

CREATE TABLE `app_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(2, 'admin1', 'admin1', 'admin@adminaaaa.com', 'admin@adminaaaa.com', 1, NULL, '$2y$13$EcjFTIz5iDMwMzDEotUb7O09FXHi.SUMsxTd7wf9k4WJjlUgF3AYG', '2018-05-09 15:30:11', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}'),
(3, 'asd', 'asd', 'asd@das.com', 'asd@das.com', 1, NULL, '$2y$13$Nzp58zaMDGrjKEzKWJum4uZXvs1fUXPbKATiscAbVso9TUk6Kzo0G', '2018-05-09 14:33:55', NULL, NULL, 'a:0:{}'),
(5, 'testuser', 'testuser', 'asd@ads.com', 'asd@ads.com', 1, NULL, '$2y$13$1gvcr3Oy4m.oc1AKWOLOEua9qmpv6vj4DxdyYitWp5.lF6B9EJI7W', NULL, NULL, NULL, 'a:0:{}'),
(8, 'user', 'user', 'asd@dasd12.com', 'asd@dasd12.com', 1, NULL, '$2y$13$0jLJkI8q2dFVvf9ykYa0BOdZLtpJjS1lRsDvMjcJUMEfeZ4uygiI6', NULL, NULL, NULL, 'a:0:{}'),
(12, 'AlexFF', 'alexff', 'asd@dasd111.com', 'asd@dasd111.com', 1, NULL, '$2y$13$b1l8SsWNaKze3QX7tdTeau1JxkJUX5uMakiy1HVuVbGR17lEUYJ1C', '2018-05-09 15:29:36', NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `username`, `lastname`, `birthday`, `password`, `is_active`, `roles`) VALUES
(5, 'alexuryu', 'alex@gmail.com', 'Alex', 'Uryumtsev', '2013-01-01', '1', 1, '[]');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E9AA08CB10` (`login`),
  ADD UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
