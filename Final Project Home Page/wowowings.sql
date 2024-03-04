-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2024 at 10:41 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wowowings`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `order_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `item_id` int(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `list_of_products`
--

CREATE TABLE `list_of_products` (
  `item_id` int(255) NOT NULL,
  `itemname` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `list_of_products`
--

INSERT INTO `list_of_products` (`item_id`, `itemname`, `description`, `price`, `quantity`) VALUES
(1, 'Classic Buffalo', 'Dive into the timeless perfection of our Classic Buffalo wings, bathed in a tangy buffalo sauce that packs just the right punch of heat. Served with a side of cool ranch dressing for the ultimate flavor balance.', 120, 999),
(2, 'Honey BBQ Bliss', 'Indulge in the sweet and smoky sensation of our Honey BBQ wings, glazed to perfection with a luscious blend of honey and barbecue sauce. Each bite is a journey through layers of rich flavor that will leave you craving for seconds.', 120, 999),
(3, 'Spicy Garlic Fusion', 'Experience the fiery allure of our Spicy Garlic wings, where garlic meets chili in a tantalizing dance of flavors. Each bite bursts with zesty garlic goodness and a kick of spicy heat that will keep you coming back for more.', 120, 999),
(4, 'Soy Ginger Delight:', 'Take your taste buds on an exotic adventure with our Soy Ginger wings, marinated in a harmonious blend of soy sauce, ginger, and a hint of sweetness. Each bite is a burst of Asian-inspired flavors that will transport you to culinary bliss.', 120, 999),
(5, 'Lemon Pepper Zest:', 'Refresh your palate with our Lemon Pepper wings, infused with the zesty tang of lemon and the aromatic warmth of freshly ground black pepper. Each bite is a burst of citrusy freshness that will leave you feeling invigorated.', 120, 999),
(6, 'BBQ Bacon Cheese', 'What\'s a burger without bacon? Our crispy, hickory-smoked bacon adds a tantalizing crunch and a rich, savory depth to every bite. It\'s the perfect complement to the hearty beef patty, adding an extra layer of indulgence to your burger experience.', 150, 999),
(7, 'Eggs-Benedict Burger', 'Elevating the burger game to new heights, we top our masterpiece with a perfectly poached egg, inspired by the classic Eggs Benedict. Imagine the creamy yolk cascading over the beef patty, infusing each bite with luxurious richness and decadence. It\'s a b', 150, 999),
(8, 'Taro', 'Indulge your senses with our Taro milk tea. Savor the subtle sweetness and nutty undertones of taro perfectly blended with creamy milk, creating a delightful concoction that\'s both satisfying and addictive.', 100, 999),
(9, 'Wintermelon', 'Experience pure refreshment with our Wintermelon milk tea. Delight in the crisp, subtly sweet flavor of wintermelon infused with creamy milk, offering a cooling and rejuvenating drink that\'s sure to brighten your day.', 100, 999),
(10, 'Milky Matcha', 'Dive into a world of creamy indulgence with our Milky Matcha tea. Experience the perfect balance of rich green tea flavor and silky smooth milk, creating a refreshing yet comforting beverage that will leave you craving more.', 100, 999);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `username`, `password`, `firstname`, `lastname`, `mobile`, `address`, `email`) VALUES
(1, 'jlnmrls', 'p@ssWorD', 'Julian', 'Morales', '0921237736', 'Quezon City', 'jlnmrls@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `cart1` (`item_id`),
  ADD KEY `cart2` (`user_id`);

--
-- Indexes for table `list_of_products`
--
ALTER TABLE `list_of_products`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `list_of_products`
--
ALTER TABLE `list_of_products`
  MODIFY `item_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart1` FOREIGN KEY (`item_id`) REFERENCES `list_of_products` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart2` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
