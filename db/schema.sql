CREATE DATABASE IF NOT EXISTS Farmx
USE Farmx;

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `pincode` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `dateofbirth` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE IF NOT EXISTS `products` (
    `uid` int(11) NOT NULL;
    `prodid` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `description` varchar(255) DEFAULT NUll,
    `askprice` varchar(255) NOT NULL,
    -- `image` varchar(255) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`prodid`), 
    FOREIGN KEY (`userid`) REFERENCES `users`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bids` (
    `bidid` int(11) NOT NULL AUTO_INCREMENT,
    `prodid` int(11) NOT NULL,
    `userid` int(11) NOT NULL,
    `bidprice` varchar(255) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`bidid`),
    FOREIGN KEY (`prodid`) REFERENCES `products`(`prodid`),
    FOREIGN KEY (`userid`) REFERENCES `users`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `orders` (
    `orderid` int(11) NOT NULL AUTO_INCREMENT,
    `prodid` int(11) NOT NULL,
    `userid` int(11) NOT NULL,
    `bidid` int(11) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`orderid`),
    FOREIGN KEY (`prodid`) REFERENCES `products`(`prodid`),
    FOREIGN KEY (`userid`) REFERENCES `users`(`userid`),
    FOREIGN KEY (`bidid`) REFERENCES `bids`(`bidid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

