DROP DATABASE IF EXISTS huskyDenDB;
CREATE DATABASE huskyDenDB;
USE huskyDenDB;

DROP TABLE IF EXISTS `SystemAdministrator`;
CREATE TABLE `SystemAdministrator` (
    `adminID` INTEGER AUTO_INCREMENT PRIMARY KEY ,
    `firstName` VARCHAR(50),
    `lastName` VARCHAR(50),
    `email` VARCHAR(75)
);

DROP TABLE IF EXISTS `Alumni`;
CREATE TABLE `Alumni` (
    `alumID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `major` VARCHAR(50) NOT NULL,
    `email` VARCHAR(75),
    `company` VARCHAR(50),
    `city` VARCHAR(50),
    `adminID` INTEGER NOT NULL,
    FOREIGN KEY (`adminID`)
        REFERENCES `SystemAdministrator` (`adminID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `CoopAdvisor`;
CREATE TABLE `CoopAdvisor` (
    `advisorID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `email` VARCHAR(75),
    `adminID` INTEGER NOT NULL,
    FOREIGN KEY (`adminID`)
        REFERENCES `SystemAdministrator` (`adminID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student` (
    `nuID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `major` VARCHAR(50) NOT NULL,
    `email` VARCHAR(75),
    `company` VARCHAR(50),
    `city` VARCHAR(75),
    `adminID` INTEGER NOT NULL,
    `advisorID` INTEGER NOT NULL,
    `housingStatus` VARCHAR(50) NOT NULL,
    FOREIGN KEY (`adminID`)
        REFERENCES `SystemAdministrator` (`adminID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`advisorID`)
        REFERENCES `CoopAdvisor` (`advisorID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Parent`;
CREATE TABLE `Parent` (
    `parentID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `relationshipToStudent` VARCHAR(50),
    `firstName` VARCHAR(50),
    `lastName` VARCHAR(50),
    `email` VARCHAR(75),
    `phone` VARCHAR(15)
);

DROP TABLE IF EXISTS `StudentParent`;
CREATE TABLE `StudentParent` (
    `studentID` INTEGER,
    `parentID` INTEGER,
    PRIMARY KEY (`studentID`, `parentID`),
    FOREIGN KEY (`studentID`)
        REFERENCES `Student` (`nuID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`parentID`)
        REFERENCES `Parent` (`parentID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Performance`;
CREATE TABLE `Performance` (
    `metricID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `metricName` VARCHAR(50),
    `value` INTEGER NOT NULL,
    `timeStamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `adminID` INTEGER NOT NULL,
    FOREIGN KEY (`adminID`)
        REFERENCES `SystemAdministrator`(`adminID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Updates`;
CREATE TABLE `Updates` (
    `updateID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `updateName` VARCHAR(50),
    `updateDescription` TEXT,
    `timeStamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `adminID` INTEGER NOT NULL,
    FOREIGN KEY (`adminID`)
        REFERENCES `SystemAdministrator`(`adminID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `AlumAdvisor`;
CREATE TABLE `AlumAdvisor` (
    `alumID` INTEGER NOT NULL,
    `advisorID` INTEGER NOT NULL,
    PRIMARY KEY (`alumID`, `advisorID`),
    FOREIGN KEY (`alumID`)
        REFERENCES `Alumni`(`alumID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`advisorID`)
        REFERENCES `CoopAdvisor` (`advisorID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `AlumStudent`;
CREATE TABLE `AlumStudent` (
    `nuID` INTEGER NOT NULL,
    `alumID` INTEGER NOT NULL,
    PRIMARY KEY (`nuID`, `alumID`),
    FOREIGN KEY (`nuID`)
        REFERENCES `Student`(`nuID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`alumID`)
        REFERENCES `Alumni` (`alumID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Apartment`;
CREATE TABLE `Apartment` (
    `alumID` INTEGER NOT NULL,
    `housingID` INTEGER AUTO_INCREMENT NOT NULL,
    `beds` INTEGER NOT NULL,
    `baths` INTEGER NOT NULL,
    `rent` INTEGER NOT NULL,
    `description` TEXT,
    `dateAvailableFrom` DATETIME NOT NULL,
    `dateAvailableTo` DATETIME NOT NULL,
    `street` VARCHAR(75) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `state` VARCHAR(50),
    `country` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`housingID`,`alumID`),
    FOREIGN KEY (`alumID`)
        REFERENCES `Alumni` (`alumID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
DROP TABLE IF EXISTS `Recommendation`;
CREATE TABLE `Recommendation` (
    `alumID` INTEGER NOT NULL,
    `establishmentID` INTEGER AUTO_INCREMENT NOT NULL,
    `establishment` VARCHAR(75),
    `category` VARCHAR(75),
    `location` VARCHAR(75),
    `priceRating` INTEGER NOT NULL,
    PRIMARY KEY (`establishmentID`, `alumID`),
    FOREIGN KEY (`alumID`)
        REFERENCES `Alumni` (`alumID`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `SystemAdministrator`;
TRUNCATE TABLE `Alumni`;
TRUNCATE TABLE `CoopAdvisor`;
TRUNCATE TABLE `Student`;
TRUNCATE TABLE `Parent`;
TRUNCATE TABLE `StudentParent`;
TRUNCATE TABLE `Recommendation`;
TRUNCATE TABLE `Performance`;
TRUNCATE TABLE `Updates`;
TRUNCATE TABLE `Recommendation`;
TRUNCATE TABLE `AlumStudent`;
TRUNCATE TABLE `Apartment`;
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO `SystemAdministrator` (`firstName`, `lastName`, `email`) VALUES
('Michael', 'Smith', 'michael.smith@huskyden.com'),
('Jessica', 'Johnson', 'jessica.johnson@huskyden.com'),
('Emily', 'Brown', 'emily.brown@huskyden.com'),
('Matthew', 'Williams', 'matthew.williams@huskyden.com'),
('Daniel', 'Jones', 'daniel.jones@huskyden.com'),
('Sarah', 'Garcia', 'sarah.garcia@huskyden.com'),
('Ashley', 'Martinez', 'ashley.martinez@huskyden.com'),
('Christopher', 'Rodriguez', 'chris.rodriguez@huskyden.com'),
('Amanda', 'Davis', 'amanda.davis@huskyden.com'),
('David', 'Hernandez', 'david.hernandez@huskyden.com'),
('Andrew', 'Moore', 'andrew.moore@huskyden.com'),
('Elizabeth', 'Taylor', 'elizabeth.taylor@huskyden.com'),
('James', 'Anderson', 'james.anderson@huskyden.com'),
('Megan', 'Thomas', 'megan.thomas@huskyden.com'),
('Joshua', 'Jackson', 'joshua.jackson@huskyden.com'),
('Lauren', 'White', 'lauren.white@huskyden.com'),
('Ryan', 'Harris', 'ryan.harris@huskyden.com'),
('Sophia', 'Martin', 'sophia.martin@huskyden.com'),
('Jacob', 'Thompson', 'jacob.thompson@huskyden.com'),
('Anna', 'Lopez', 'anna.lopez@huskyden.com'),
('Jonathan', 'Clark', 'jonathan.clark@huskyden.com'),
('Victoria', 'Lee', 'victoria.lee@huskyden.com'),
('Ethan', 'Walker', 'ethan.walker@huskyden.com'),
('Isabella', 'Hall', 'isabella.hall@huskyden.com'),
('Christopher', 'Allen', 'chris.allen@huskyden.com'),
('Abigail', 'Young', 'abigail.young@huskyden.com'),
('Alexander', 'King', 'alex.king@huskyden.com'),
('Grace', 'Wright', 'grace.wright@huskyden.com'),
('Lucas', 'Scott', 'lucas.scott@huskyden.com'),
('Olivia', 'Green', 'olivia.green@huskyden.com');

INSERT INTO `Alumni` (`firstName`, `lastName`, `major`, `email`, `company`, `city`, `adminID`) VALUES
('Ted', 'Ohsry', 'Environmental Science', 'ted.ohsry@alumni.com', 'SmartGreen', 'San Francisco', 1),
('Lily', 'Cruz', 'Business Administration', 'lily.cruz@alumni.com', 'CloudSphere', 'Los Angeles', 2),
('Ethan', 'Ward', 'Mechanical Engineering', 'ethan.ward@alumni.com', 'BrightWorks', 'San Diego', 3),
('Zoe', 'Adkins', 'Computer Science', 'zoe.adkins@alumni.com', 'NextGen Solutions', 'Austin', 4),
('Victoria', 'Cole', 'Biotechnology', 'victoria.cole@alumni.com', 'EcoLife', 'Denver', 5),
('Nathan', 'Baker', 'Civil Engineering', 'nathan.baker@alumni.com', 'BlueBridge', 'Chicago', 6),
('Chloe', 'Price', 'Finance', 'chloe.price@alumni.com', 'SolarNova', 'Seattle', 7),
('Benjamin', 'Carter', 'Data Analytics', 'benjamin.carter@alumni.com', 'AlphaGrowth', 'Boston', 8),
('Sophia', 'Flores', 'Marketing', 'sophia.flores@alumni.com', 'GreenFuture', 'Houston', 9),
('James', 'Brooks', 'Electrical Engineering', 'james.brooks@alumni.com', 'BrightEnergy', 'Phoenix', 10),
('Scarlett', 'Powell', 'Information Technology', 'scarlett.powell@alumni.com', 'EcoVision', 'Philadelphia', 11),
('Charlotte', 'Morris', 'Physics', 'charlotte.morris@alumni.com', 'NextStep', 'Miami', 12),
('Avery', 'Diaz', 'Computer Engineering', 'avery.diaz@alumni.com', 'ProGrowth', 'Portland', 13),
('Liam', 'Rogers', 'Software Engineering', 'liam.rogers@alumni.com', 'GreenNet', 'Atlanta', 14),
('Noah', 'Alexander', 'Mathematics', 'noah.alexander@alumni.com', 'VisionaryTech', 'New York', 15),
('Eleanor', 'Hayes', 'Environmental Engineering', 'eleanor.hayes@alumni.com', 'EcoWorld', 'Dallas', 16),
('Grace', 'Jenkins', 'Economics', 'grace.jenkins@alumni.com', 'PureSolutions', 'Baltimore', 17),
('Isaac', 'Howard', 'Chemical Engineering', 'isaac.howard@alumni.com', 'BrightStart', 'San Jose', 18),
('Emma', 'Hill', 'Health Sciences', 'emma.hill@alumni.com', 'SolarEdge', 'Charlotte', 19),
('Alexander', 'Kelly', 'Robotics', 'alexander.kelly@alumni.com', 'NextEra', 'Indianapolis', 20),
('Isabella', 'Watson', 'Astrophysics', 'isabella.watson@alumni.com', 'BrightHorizons', 'Kansas City', 21),
('Aiden', 'Long', 'Cybersecurity', 'aiden.long@alumni.com', 'FutureNet', 'Columbus', 22),
('Liam', 'Stewart', 'Sociology', 'liam.stewart@alumni.com', 'SolarBridge', 'Milwaukee', 23),
('Olivia', 'Rivera', 'Accounting', 'olivia.rivera@alumni.com', 'BrightTech', 'Salt Lake City', 24),
('Lucas', 'Cook', 'Art and Design', 'lucas.cook@alumni.com', 'GreenWave', 'Orlando', 25),
('Sophia', 'Bell', 'Geology', 'sophia.bell@alumni.com', 'NextWave', 'Tampa', 26),
('Evelyn', 'Murphy', 'Anthropology', 'evelyn.murphy@alumni.com', 'AlphaNet', 'Minneapolis', 27),
('Mason', 'Griffin', 'Statistics', 'mason.griffin@alumni.com', 'BrightFuture', 'Pittsburgh', 28),
('Chloe', 'Sanders', 'Education', 'chloe.sanders@alumni.com', 'SolarWorks', 'Raleigh', 29),
('Zachary', 'Russell', 'Mechanical Engineering', 'zachary.russell@alumni.com', 'GreenEdge', 'Cleveland', 30),
('Michael', 'Smith', 'Engineering Management', 'michael.smith@alumni.com', 'TechCorp', 'New York', 1),
('Jessica', 'Johnson', 'History', 'jessica.johnson@alumni.com', 'Innovate Ltd', 'Boston', 2),
('Emily', 'Brown', 'Education', 'emily.brown@alumni.com', 'DataSoft', 'San Francisco', 3),
('Matthew', 'Williams', 'Cybersecurity', 'matthew.williams@alumni.com', 'GreenTech', 'Seattle', 4),
('Daniel', 'Jones', 'Energy Systems', 'daniel.jones@alumni.com', 'EcoEnergy', 'Chicago', 5),
('Sarah', 'Garcia', 'Environmental Science', 'sarah.garcia@alumni.com', 'NextGen Inc', 'Austin', 6),
('Ashley', 'Martinez', 'Computer Science', 'ashley.martinez@alumni.com', 'WebWare', 'Dallas', 7),
('Christopher', 'Rodriguez', 'Mechanical Engineering', 'chris.rodriguez@alumni.com', 'BuildRight', 'Denver', 8),
('Amanda', 'Davis', 'Health Sciences', 'amanda.davis@alumni.com', 'BlueOcean', 'Los Angeles', 9),
('David', 'Hernandez', 'Physics', 'david.hernandez@alumni.com', 'AlphaBio', 'Miami', 10),
('Andrew', 'Moore', 'Political Science', 'andrew.moore@alumni.com', 'SkyWorks', 'Phoenix', 11),
('Elizabeth', 'Taylor', 'Mathematics', 'elizabeth.taylor@alumni.com', 'CloudSync', 'Houston', 12),
('James', 'Anderson', 'Sociology', 'james.anderson@alumni.com', 'ProNet', 'San Diego', 13),
('Megan', 'Thomas', 'Nursing', 'megan.thomas@alumni.com', 'AgriMax', 'Atlanta', 14),
('Joshua', 'Jackson', 'Civil Engineering', 'joshua.jackson@alumni.com', 'TechWave', 'Orlando', 15),
('Lauren', 'White', 'Environmental Science', 'lauren.white@alumni.com', 'FutureEdge', 'Pittsburgh', 16),
('Ryan', 'Harris', 'Biology', 'ryan.harris@alumni.com', 'EcoSolutions', 'Columbus', 17),
('Sophia', 'Martin', 'Astronomy', 'sophia.martin@alumni.com', 'NextPhase', 'Salt Lake City', 18),
('Jacob', 'Thompson', 'Economics', 'jacob.thompson@alumni.com', 'SolarSync', 'Tampa', 19),
('Anna', 'Lopez', 'Statistics', 'anna.lopez@alumni.com', 'BrightPath', 'Nashville', 20),
('Jonathan', 'Clark', 'Philosophy', 'jonathan.clark@alumni.com', 'UrbanGrid', 'Baltimore', 21),
('Victoria', 'Lee', 'Journalism', 'victoria.lee@alumni.com', 'GreenField', 'Minneapolis', 22),
('Ethan', 'Walker', 'Graphic Design', 'ethan.walker@alumni.com', 'TechNova', 'Portland', 23),
('Isabella', 'Hall', 'Social Sciences', 'isabella.hall@alumni.com', 'AquaVantage', 'Raleigh', 24),
('Christopher', 'Allen', 'Urban Studies', 'chris.allen@alumni.com', 'PureTech', 'Kansas City', 25),
('Abigail', 'Young', 'Liberal Arts', 'abigail.young@alumni.com', 'BioWare', 'Indianapolis', 26),
('Alexander', 'King', 'Engineering', 'alex.king@alumni.com', 'SmartHomes', 'Milwaukee', 27),
('Grace', 'Wright', 'Chemistry', 'grace.wright@alumni.com', 'SecureNet', 'Sacramento', 28),
('Lucas', 'Scott', 'Business Analytics', 'lucas.scott@alumni.com', 'VisionTech', 'Charlotte', 29),
('Olivia', 'Green', 'Marketing', 'olivia.green@alumni.com', 'AgriGen', 'Omaha', 30),
('Nathan', 'Hill', 'Psychology', 'nathan.hill@alumni.com', 'HealthSync', 'Cleveland', 1),
('Emma', 'Adams', 'Physics', 'emma.adams@alumni.com', 'CodeWave', 'Richmond', 2),
('Zoe', 'Nelson', 'Public Relations', 'zoe.nelson@alumni.com', 'SmartEnergy', 'Anchorage', 3),
('Michael', 'Carter', 'Energy Systems', 'michael.carter@alumni.com', 'BrightTech', 'Boise', 4),
('Sophia', 'Mitchell', 'Environmental Science', 'sophia.mitchell@alumni.com', 'EcoGrow', 'Montgomery', 5),
('James', 'Perez', 'Engineering Management', 'james.perez@alumni.com', 'GeoSystems', 'Albuquerque', 6),
('Lily', 'Roberts', 'Cybersecurity', 'lily.roberts@alumni.com', 'FutureLink', 'Charleston', 7),
('Benjamin', 'Evans', 'Urban Studies', 'benjamin.evans@alumni.com', 'VisionEdge', 'Hartford', 8),
('Ella', 'Lewis', 'Political Science', 'ella.lewis@alumni.com', 'AutoTech', 'Des Moines', 9),
('William', 'Collins', 'Computer Science', 'william.collins@alumni.com', 'SolarEdge', 'Little Rock', 10),
('Natalie', 'James', 'Biology', 'natalie.james@alumni.com', 'LifeWorks', 'Fresno', 11),
('Catherine', 'Perry', 'Physics', 'catherine.perry@alumni.com', 'SecureBio', 'Spokane', 12),
('Anthony', 'Griffin', 'Civil Engineering', 'anthony.griffin@alumni.com', 'NetWorld', 'Tulsa', 13),
('Hannah', 'Henderson', 'Environmental Science', 'hannah.henderson@alumni.com', 'BlueWave', 'Honolulu', 14),
('Zachary', 'Foster', 'Information Technology', 'zachary.foster@alumni.com', 'BrightEnergy', 'Reno', 15),
('Chloe', 'Reed', 'Data Analytics', 'chloe.reed@alumni.com', 'TechFusion', 'Augusta', 16),
('Brandon', 'Murphy', 'Nursing', 'brandon.murphy@alumni.com', 'HealthLink', 'Shreveport', 17),
('Samantha', 'Sullivan', 'Psychology', 'samantha.sullivan@alumni.com', 'GreenEnergy', 'Trenton', 18),
('Evelyn', 'Barnes', 'Mechanical Engineering', 'evelyn.barnes@alumni.com', 'InnovativeTech', 'Madison', 19),
('Noah', 'Bell', 'Chemical Engineering', 'noah.bell@alumni.com', 'ProSync', 'Fort Worth', 20),
('Liam', 'Gonzalez', 'Business Administration', 'liam.gonzalez@alumni.com', 'BrightEco', 'Wichita', 21),
('Avery', 'Russell', 'Finance', 'avery.russell@alumni.com', 'TechEdge', 'Jacksonville', 22),
('Victoria', 'Bennett', 'Biotechnology', 'victoria.bennett@alumni.com', 'LifeLink', 'St. Louis', 23),
('Charlotte', 'Bailey', 'Cybersecurity', 'charlotte.bailey@alumni.com', 'SolarTech', 'Birmingham', 24),
('Mason', 'Graves', 'Mathematics', 'mason.graves@alumni.com', 'NextWave', 'San Antonio', 25),
('Scarlett', 'Wright', 'Political Science', 'scarlett.wright@alumni.com', 'CloudTech', 'Memphis', 26),
('Samuel', 'Cook', 'Physics', 'samuel.cook@alumni.com', 'BrightNet', 'El Paso', 27),
('Grace', 'Peterson', 'Health Sciences', 'grace.peterson@alumni.com', 'GreenSys', 'Louisville', 28),
('Eleanor', 'Long', 'Economics', 'eleanor.long@alumni.com', 'HealthWave', 'Raleigh', 29),
('Benjamin', 'Campbell', 'Robotics', 'benjamin.campbell@alumni.com', 'FutureBio', 'Portland', 30);


INSERT INTO `CoopAdvisor` (`firstName`, `lastName`, `email`, `adminID`) VALUES
('John', 'Smith', 'john.smith@coop.com', 1),
('Emily', 'Johnson', 'emily.johnson@coop.com', 2),
('Michael', 'Brown', 'michael.brown@coop.com', 3),
('Sarah', 'Davis', 'sarah.davis@coop.com', 4),
('Jessica', 'Miller', 'jessica.miller@coop.com', 5),
('Daniel', 'Wilson', 'daniel.wilson@coop.com', 6),
('Olivia', 'Taylor', 'olivia.taylor@coop.com', 7),
('Ethan', 'Martinez', 'ethan.martinez@coop.com', 8),
('Sophia', 'Harris', 'sophia.harris@coop.com', 9),
('James', 'Clark', 'james.clark@coop.com', 10),
('Charlotte', 'Lewis', 'charlotte.lewis@coop.com', 11),
('Benjamin', 'Lee', 'benjamin.lee@coop.com', 12),
('Ava', 'White', 'ava.white@coop.com', 13),
('Liam', 'Hall', 'liam.hall@coop.com', 14),
('Noah', 'Young', 'noah.young@coop.com', 15),
('Emma', 'King', 'emma.king@coop.com', 16),
('Mason', 'Wright', 'mason.wright@coop.com', 17),
('Lucas', 'Scott', 'lucas.scott@coop.com', 18),
('Chloe', 'Green', 'chloe.green@coop.com', 19),
('Alexander', 'Adams', 'alexander.adams@coop.com', 20),
('Isabella', 'Nelson', 'isabella.nelson@coop.com', 21),
('Nathan', 'Baker', 'nathan.baker@coop.com', 22),
('Olivia', 'Mitchell', 'olivia.mitchell@coop.com', 23),
('Evelyn', 'Perez', 'evelyn.perez@coop.com', 24),
('William', 'Roberts', 'william.roberts@coop.com', 25),
('Sophia', 'Turner', 'sophia.turner@coop.com', 26),
('Ella', 'Phillips', 'ella.phillips@coop.com', 27),
('Ryan', 'Campbell', 'ryan.campbell@coop.com', 28),
('Chloe', 'Parker', 'chloe.parker@coop.com', 29),
('Ethan', 'Evans', 'ethan.evans@coop.com', 30),
('Abigail', 'Collins', 'abigail.collins@coop.com', 1),
('Matthew', 'Edwards', 'matthew.edwards@coop.com', 2),
('Zoe', 'Foster', 'zoe.foster@coop.com', 3),
('Joshua', 'Gray', 'joshua.gray@coop.com', 4),
('Victoria', 'Brooks', 'victoria.brooks@coop.com', 5),
('Nathan', 'Hughes', 'nathan.hughes@coop.com', 6),
('Emily', 'Ward', 'emily.ward@coop.com', 7),
('Michael', 'Cruz', 'michael.cruz@coop.com', 8),
('Avery', 'Reed', 'avery.reed@coop.com', 9),
('Lucas', 'Morgan', 'lucas.morgan@coop.com', 10);

INSERT INTO `Student` (`firstName`, `lastName`, `major`, `email`, `company`, `city`, `adminID`, `advisorID`, `housingStatus`) VALUES
('John', 'Doe', 'Computer Science', 'john.doe@student.com', 'SmartGreen', 'New York', 1, 1, 1),
('Jane', 'Smith', 'Business', 'jane.smith@student.com', 'CloudSphere', 'Los Angeles', 2, 2, 0),
('Adam', 'Taylor', 'Mechanical Engineering', 'adam.taylor@student.com', 'BrightWorks', 'Chicago', 3, 3, 1),
('Eve', 'Johnson', 'Environmental Science', 'eve.johnson@student.com', 'NextGen Solutions', 'Austin', 4, 4, 1),
('Rachel', 'Williams', 'Biotechnology', 'rachel.williams@student.com', 'EcoLife', 'San Diego', 5, 5, 0),
('Ryan', 'Smith', 'Civil Engineering', 'ryan.smith@student.com', 'BlueBridge', 'Seattle', 6, 6, 1),
('Diana', 'Clark', 'Finance', 'diana.clark@student.com', 'SolarNova', 'San Francisco', 7, 7, 1),
('Noah', 'Brown', 'Data Science', 'noah.brown@student.com', 'AlphaGrowth', 'Boston', 8, 8, 1),
('Emily', 'Davis', 'Marketing', 'emily.davis@student.com', 'GreenFuture', 'Houston', 9, 9, 0),
('Lucas', 'Miller', 'Electrical Engineering', 'lucas.miller@student.com', 'BrightEnergy', 'Phoenix', 10, 10, 0),
('Sophia', 'Wilson', 'Information Technology', 'sophia.wilson@student.com', 'EcoVision', 'Philadelphia', 11, 11, 1),
('Liam', 'Anderson', 'Physics', 'liam.anderson@student.com', 'NextStep', 'Miami', 12, 12, 0),
('Olivia', 'Martinez', 'Computer Engineering', 'olivia.martinez@student.com', 'ProGrowth', 'Portland', 13, 13, 1),
('Ethan', 'Walker', 'Software Engineering', 'ethan.walker@student.com', 'GreenNet', 'Atlanta', 14, 14, 0),
('Zoe', 'Harris', 'Mathematics', 'zoe.harris@student.com', 'VisionaryTech', 'New York', 15, 15, 0),
('Ava', 'Clark', 'Environmental Engineering', 'ava.clark@student.com', 'EcoWorld', 'Dallas', 16, 16, 1),
('Grace', 'Baker', 'Economics', 'grace.baker@student.com', 'PureSolutions', 'Baltimore', 17, 17, 1),
('Isaac', 'Taylor', 'Chemical Engineering', 'isaac.taylor@student.com', 'BrightStart', 'San Jose', 18, 18, 0),
('Emma', 'Green', 'Health Sciences', 'emma.green@student.com', 'SolarEdge', 'Charlotte', 19, 19, 0),
('Alexander', 'Adams', 'Robotics', 'alexander.adams@student.com', 'NextEra', 'Indianapolis', 20, 20, 1),
('Lily', 'Cooper', 'Astrophysics', 'lily.cooper@student.com', 'BrightHorizons', 'Kansas City', 21, 21, 1),
('Nathan', 'Gray', 'Cybersecurity', 'nathan.gray@student.com', 'FutureNet', 'Columbus', 22, 22, 1),
('Chloe', 'Foster', 'Sociology', 'chloe.foster@student.com', 'SolarBridge', 'Milwaukee', 23, 23, 1),
('Olivia', 'Allen', 'Accounting', 'olivia.allen@student.com', 'BrightTech', 'Salt Lake City', 24, 24, 0),
('Mason', 'Brooks', 'Art and Design', 'mason.brooks@student.com', 'GreenWave', 'Orlando', 25, 25, 1),
('Sophia', 'Lee', 'Geology', 'sophia.lee@student.com', 'NextWave', 'Tampa', 26, 26, 1),
('Jacob', 'Nelson', 'Anthropology', 'jacob.nelson@student.com', 'AlphaNet', 'Minneapolis', 27, 27, 0),
('Evelyn', 'Collins', 'Statistics', 'evelyn.collins@student.com', 'BrightFuture', 'Pittsburgh', 28, 28, 0),
('Ryan', 'Parker', 'Education', 'ryan.parker@student.com', 'SolarWorks', 'Raleigh', 29, 29, 0),
('Abigail', 'Edwards', 'Mechanical Engineering', 'abigail.edwards@student.com', 'GreenEdge', 'Cleveland', 30, 30, 0),
('Benjamin', 'Hill', 'Psychology', 'benjamin.hill@student.com', 'FuturePath', 'Richmond', 1, 31, 1),
('Charlotte', 'Lopez', 'Urban Planning', 'charlotte.lopez@student.com', 'NextGrid', 'Anchorage', 2, 32, 1),
('Ella', 'Scott', 'Graphic Design', 'ella.scott@student.com', 'ProSolutions', 'Boise', 3, 33, 1),
('William', 'Johnson', 'International Relations', 'william.johnson@student.com', 'EcoStart', 'Augusta', 4, 34, 1),
('Isabella', 'White', 'Agriculture', 'isabella.white@student.com', 'VisionNova', 'Reno', 5, 35, 0),
('Liam', 'Thompson', 'Biomedical Engineering', 'liam.thompson@student.com', 'BrightSystems', 'Shreveport', 6, 36, 1),
('Sophia', 'Green', 'Political Science', 'sophia.green@student.com', 'GreenCore', 'Trenton', 7, 37, 0),
('Ethan', 'Taylor', 'Environmental Science', 'ethan.taylor@student.com', 'FutureWave', 'Madison', 8, 38, 1),
('Avery', 'Lewis', 'Public Health', 'avery.lewis@student.com', 'ProEdge', 'Fort Worth', 9, 39, 0),
('Nathan', 'Garcia', 'Social Work', 'nathan.garcia@student.com', 'GreenWorks', 'Wichita', 10, 40, 1),
('Ella', 'Martinez', 'Industrial Design', 'ella.martinez@student.com', 'NextGen', 'Oklahoma City', 11, 1, 0),
('Alexander', 'Moore', 'Economics', 'alexander.moore@student.com', 'BrightIdeas', 'San Antonio', 12, 2, 0),
('Victoria', 'Allen', 'Chemical Engineering', 'victoria.allen@student.com', 'GreenHorizons', 'Denver', 13, 3, 0),
('Lucas', 'Carter', 'Physics', 'lucas.carter@student.com', 'FuturePath', 'Seattle', 14, 4, 1),
('Isabella', 'Bennett', 'Data Analytics', 'isabella.bennett@student.com', 'BrightTech', 'Salt Lake City', 15, 5, 0),
('Abby', 'Mitchell', 'History', 'abby.mitchell@student.com', 'Innovate Ltd', 'Boston', 2, 2, 0),
('Emily', 'Rivera', 'Education', 'emily.rivera@student.com', 'DataSoft', 'San Francisco', 3, 3, 0),
('Matthew', 'Sanders', 'Cybersecurity', 'matthew.sanders@student.com', 'GreenTech', 'Seattle', 4, 4, 0),
('Daniel', 'Phillips', 'Energy Systems', 'daniel.phillips@student.com', 'EcoEnergy', 'Chicago', 5, 5, 1),
('Sarah', 'Roberts', 'Environmental Science', 'sarah.roberts@student.com', 'NextGen Inc', 'Austin', 6, 6, 0),
('Ashley', 'Powell', 'Computer Science', 'ashley.powell@student.com', 'WebWare', 'Dallas', 7, 7, 0),
('Christopher', 'Morris', 'Mechanical Engineering', 'chris.morris@student.com', 'BuildRight', 'Denver', 8, 8, 1),
('Amanda', 'Brooks', 'Health Sciences', 'amanda.brooks@student.com', 'BlueOcean', 'Los Angeles', 9, 9, 1),
('David', 'Morgan', 'Physics', 'david.morgan@student.com', 'AlphaBio', 'Miami', 10, 10, 1),
('Andrew', 'Bell', 'Political Science', 'andrew.bell@student.com', 'SkyWorks', 'Phoenix', 11, 11, 1),
('Elizabeth', 'Nelson', 'Mathematics', 'elizabeth.nelson@student.com', 'CloudSync', 'Houston', 12, 12, 1),
('James', 'Adams', 'Sociology', 'james.adams@student.com', 'ProNet', 'San Diego', 13, 13, 1),
('Megan', 'Diaz', 'Nursing', 'megan.diaz@student.com', 'AgriMax', 'Atlanta', 14, 14, 0),
('Joshua', 'Smith', 'Civil Engineering', 'joshua.smith@student.com', 'TechWave', 'Orlando', 15, 15, 0),
('Lauren', 'Taylor', 'Environmental Science', 'lauren.taylor@student.com', 'FutureEdge', 'Pittsburgh', 16, 16, 1),
('Ryan', 'Gonzalez', 'Biology', 'ryan.gonzalez@student.com', 'EcoSolutions', 'Columbus', 17, 17, 1),
('Sophia', 'Hernandez', 'Astronomy', 'sophia.hernandez@student.com', 'NextPhase', 'Salt Lake City', 18, 18, 1),
('Jacob', 'Lopez', 'Economics', 'jacob.lopez@student.com', 'SolarSync', 'Tampa', 19, 19, 0),
('Anna', 'White', 'Statistics', 'anna.white@student.com', 'BrightPath', 'Nashville', 20, 20, 0),
('Jonathan', 'Walker', 'Philosophy', 'jonathan.walker@student.com', 'UrbanGrid', 'Baltimore', 21, 21, 1),
('Victoria', 'Allen', 'Journalism', 'victoria.allen@student.com', 'GreenField', 'Minneapolis', 22, 22, 1),
('Ethan', 'Thompson', 'Graphic Design', 'ethan.thompson@student.com', 'TechNova', 'Portland', 23, 23, 0),
('Isabella', 'Green', 'Social Sciences', 'isabella.green@student.com', 'AquaVantage', 'Raleigh', 24, 24, 0),
('Christopher', 'Hill', 'Urban Studies', 'chris.hill@student.com', 'PureTech', 'Kansas City', 25, 25, 0),
('Abigail', 'Collins', 'Liberal Arts', 'abigail.collins@student.com', 'BioWare', 'Indianapolis', 26, 26, 1),
('Alexander', 'Wright', 'Engineering', 'alex.wright@student.com', 'SmartHomes', 'Milwaukee', 27, 27, 1),
('Grace', 'Clark', 'Chemistry', 'grace.clark@student.com', 'SecureNet', 'Sacramento', 28, 28, 0),
('Lucas', 'Adams', 'Business Analytics', 'lucas.adams@student.com', 'VisionTech', 'Charlotte', 29, 29, 1),
('Olivia', 'Martinez', 'Marketing', 'olivia.martinez@student.com', 'AgriGen', 'Omaha', 30, 30, 0);



INSERT INTO `Recommendation` (`alumID`, `establishment`, `category`, `location`, `priceRating`) VALUES
(1, 'Moore and Sons', 'Park', 'North Jose', 2),
(2, 'Roth-Henderson', 'Shopping Mall', 'Williamsport', 1),
(2, 'Frank, Robinson and Brown', 'Library', 'Tinabury', 5),
(4, 'Castillo-Lewis', 'Restaurant', 'Allisonmouth', 5),
(5, 'Jones Inc', 'Library', 'Jacksonside', 1),
(6, 'Walker-Morris', 'Cafe', 'South Jasonborough', 3),
(7, 'Martinez and Sons', 'Gym', 'Davidtown', 4),
(8, 'Brown-Moore', 'Park', 'West Kennethstad', 3),
(9, 'Adams-Williams', 'Shopping Mall', 'Lake Elizabeth', 5),
(10, 'Anderson and Associates', 'Library', 'Codytown', 2),
(11, 'Harris Ltd', 'Cafe', 'South Melissahaven', 4),
(12, 'Clark-Smith', 'Restaurant', 'Lake Nancyborough', 5),
(13, 'Smith-Wilson', 'Gym', 'Jenniferbury', 3),
(14, 'Thompson-Gomez', 'Park', 'New Craigchester', 1),
(15, 'Garcia LLC', 'Shopping Mall', 'North Ronald', 2),
(16, 'King-Robinson', 'Library', 'West Brianport', 3),
(17, 'Campbell Group', 'Cafe', 'Port Jeffrey', 4),
(18, 'Rodriguez, Foster and Brown', 'Restaurant', 'North Peter', 5),
(19, 'Perez Inc', 'Gym', 'East Michelle', 1),
(20, 'Phillips-Jackson', 'Park', 'New Jenniferton', 4),
(21, 'White, Hughes and Hernandez', 'Shopping Mall', 'Hannahview', 3),
(22, 'Gonzalez Ltd', 'Library', 'Sarahborough', 2),
(23, 'Evans-Ross', 'Cafe', 'South Charlesview', 5),
(24, 'Wilson-Adams', 'Restaurant', 'Port Kimberlyland', 4),
(25, 'Wood, Gray and Edwards', 'Gym', 'South Kristinstad', 2),
(26, 'Nelson and Sons', 'Park', 'South Paulchester', 3),
(27, 'Baker LLC', 'Shopping Mall', 'West Sydney', 4),
(28, 'Johnson-Johnson', 'Library', 'New Laura', 5),
(29, 'Carter Inc', 'Cafe', 'East Michaelton', 3),
(30, 'Lopez Group', 'Restaurant', 'Lake Benjamin', 1),
(31, 'Hernandez-Campbell', 'Gym', 'East Nicole', 2),
(32, 'Diaz Ltd', 'Park', 'South Kevin', 4),
(33, 'Powell-Price', 'Shopping Mall', 'Port Gabriellaberg', 3),
(34, 'Parker LLC', 'Library', 'Lake Michelemouth', 5),
(35, 'Brooks-Collins', 'Cafe', 'New Katie', 4),
(36, 'Kelly-James', 'Restaurant', 'North Markfort', 2),
(37, 'Sanders LLC', 'Gym', 'Port Sarahville', 3),
(38, 'Morris-Cruz', 'Park', 'East Tammyville', 4),
(39, 'Mitchell-Watson', 'Shopping Mall', 'West Lauraborough', 5),
(40, 'Reed LLC', 'Library', 'New Donaldstad', 2);


INSERT INTO `Performance` (`metricName`, `value`, `adminID`) VALUES
('System Uptime (%)', 99, 1),
('Average Response Time (ms)', 200, 2),
('Task Completion Rate (%)', 95, 3),
('Error Rate (%)', 2, 4),
('System Downtime (mins)', 10, 5),
('Database Query Efficiency (%)', 92, 6),
('API Call Success Rate (%)', 98, 7),
('Memory Usage (%)', 75, 8),
('CPU Load (%)', 60, 9),
('Cache Hit Rate (%)', 85, 10),
('Disk Space Utilization (%)', 70, 11),
('Network Latency (ms)', 50, 12),
('Active Users Count', 1500, 13),
('Processed Transactions Count', 12000, 14),
('Failed Transactions Count', 15, 15),
('Service Availability (%)', 99, 16),
('Backup Success Rate (%)', 97, 17),
('Concurrent Users Capacity', 5000, 18),
('Average Data Retrieval Time (ms)', 150, 19),
('Log File Size (MB)', 300, 20),
('Peak Hour Traffic (%)', 80, 21),
('Critical Incidents Count', 2, 22),
('Task Queues Length', 120, 23),
('System Upgrade Time (mins)', 30, 24),
('Integration Success Rate (%)', 94, 25),
('Average Write Time (ms)', 250, 26),
('Session Timeout Events Count', 5, 27),
('Average Session Duration (mins)', 15, 28),
('System Restore Time (mins)', 20, 29),
('Data Transfer Speed (MB/s)', 100, 30),
('Database Connection Errors Count', 1, 1),
('Service Request Time (ms)', 220, 2),
('Scheduled Maintenance Time (mins)', 45, 3),
('Real-Time Data Processing (%)', 90, 4),
('Background Task Completion (%)', 87, 5),
('Redundancy Success Rate (%)', 96, 6),
('Error Logs Size (MB)', 250, 7),
('Performance Alerts Count', 10, 8),
('Network Packet Loss (%)', 1, 9),
('System Overload Incidents Count', 0, 10),
('Average Disk I/O Speed (MB/s)', 120, 11),
('Daily Backup Volume (GB)', 150, 12),
('User Session Errors Count', 3, 13),
('System Rollback Time (mins)', 25, 14),
('Response Time Deviation (ms)', 15, 15),
('Transaction Processing Speed (ms)', 80, 16),
('Database Indexing Efficiency (%)', 93, 17),
('Application Crashes Count', 1, 18),
('Total API Calls Processed', 20000, 19),
('Successful API Responses (%)', 98, 20);


INSERT INTO `Updates` (`updateName`, `updateDescription`, `adminID`) VALUES
('Database Optimization', 'Improved database query efficiency by indexing key tables.', 1),
('System Uptime Patch', 'Fixed a bug causing unexpected downtime in high traffic hours.', 2),
('UI Enhancement', 'Updated the dashboard layout for improved usability.', 3),
('Security Update', 'Patched vulnerabilities in user authentication module.', 4),
('API Rate Limiting', 'Implemented API rate limiting to handle traffic spikes.', 5),
('Backup System Upgrade', 'Enhanced backup mechanisms for faster recovery times.', 6),
('Load Balancer Configuration', 'Optimized load balancer for better resource distribution.', 7),
('Log Monitoring Tool', 'Deployed a real-time log monitoring solution.', 8),
('Performance Metrics Update', 'Improved accuracy of system performance reporting.', 9),
('Network Latency Reduction', 'Decreased network latency by optimizing routes.', 10),
('Error Logging Update', 'Enhanced error logging for quicker issue diagnosis.', 11),
('Cache Mechanism Improvement', 'Increased cache hit rate by adjusting configurations.', 12),
('Redundancy System Update', 'Improved redundancy protocols for better failover support.', 13),
('Task Queue Optimization', 'Reduced task queue lengths by balancing workloads.', 14),
('Database Connection Pooling', 'Implemented connection pooling to enhance performance.', 15),
('System Notifications Update', 'Added more detailed system notifications for users.', 16),
('Backup Compression', 'Enabled compression to save space on daily backups.', 17),
('Critical Alerts System', 'Set up alerts for critical incidents and response tracking.', 18),
('Real-Time Analytics', 'Introduced real-time analytics for user interactions.', 19),
('System Scaling Improvements', 'Enhanced scalability to support more concurrent users.', 20),
('API Versioning', 'Introduced API versioning for backward compatibility.', 21),
('Cloud Migration', 'Migrated key services to cloud infrastructure for reliability.', 22),
('Session Management', 'Improved session timeout handling for user security.', 23),
('Data Encryption Upgrade', 'Upgraded encryption algorithms for sensitive data.', 24),
('Error Handling Update', 'Implemented fallback mechanisms for critical processes.', 25),
('System Maintenance Tools', 'Deployed new tools for easier system maintenance.', 26),
('Network Security Update', 'Installed firewalls to prevent unauthorized access.', 27),
('Data Retention Policy Update', 'Optimized data retention policies for compliance.', 28),
('User Feedback Integration', 'Added feedback loop to improve system features.', 29),
('Mobile App Compatibility', 'Enhanced compatibility for mobile app integrations.', 30);

TRUNCATE TABLE `AlumAdvisor`;
INSERT INTO `AlumAdvisor` (`alumID`, `advisorID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 1),
(42, 2),
(43, 3),
(44, 4),
(45, 5),
(46, 6),
(47, 7),
(48, 8),
(49, 9),
(50, 10);


INSERT INTO `AlumStudent` (`nuID`, `alumID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50),
(51, 1),
(52, 2),
(53, 3),
(54, 4),
(55, 5),
(56, 6),
(57, 7),
(58, 8),
(59, 9),
(60, 10),
(61, 11),
(62, 12),
(63, 13),
(64, 14),
(65, 15),
(66, 16),
(67, 17),
(68, 18),
(69, 19),
(70, 20);

INSERT INTO `Recommendation` (`alumID`, `establishment`, `category`, `location`, `priceRating`) VALUES
(1, 'Moore and Sons', 'Park', 'North Jose', 2),
(2, 'Roth-Henderson', 'Shopping Mall', 'Williamsport', 1),
(2, 'Frank, Robinson and Brown', 'Library', 'Tinabury', 5),
(4, 'Castillo-Lewis', 'Restaurant', 'Allisonmouth', 5),
(5, 'Jones Inc', 'Library', 'Jacksonside', 1),
(6, 'Walker-Morris', 'Cafe', 'South Jasonborough', 3),
(7, 'Martinez and Sons', 'Gym', 'Davidtown', 4),
(8, 'Brown-Moore', 'Park', 'West Kennethstad', 3),
(9, 'Adams-Williams', 'Shopping Mall', 'Lake Elizabeth', 5),
(10, 'Anderson and Associates', 'Library', 'Codytown', 2),
(11, 'Harris Ltd', 'Cafe', 'South Melissahaven', 4),
(12, 'Clark-Smith', 'Restaurant', 'Lake Nancyborough', 5),
(13, 'Smith-Wilson', 'Gym', 'Jenniferbury', 3),
(14, 'Thompson-Gomez', 'Park', 'New Craigchester', 1),
(15, 'Garcia LLC', 'Shopping Mall', 'North Ronald', 2),
(16, 'King-Robinson', 'Library', 'West Brianport', 3),
(17, 'Campbell Group', 'Cafe', 'Port Jeffrey', 4),
(18, 'Rodriguez, Foster and Brown', 'Restaurant', 'North Peter', 5),
(19, 'Perez Inc', 'Gym', 'East Michelle', 1),
(20, 'Phillips-Jackson', 'Park', 'New Jenniferton', 4),
(21, 'White, Hughes and Hernandez', 'Shopping Mall', 'Hannahview', 3),
(22, 'Gonzalez Ltd', 'Library', 'Sarahborough', 2),
(23, 'Evans-Ross', 'Cafe', 'South Charlesview', 5),
(24, 'Wilson-Adams', 'Restaurant', 'Port Kimberlyland', 4),
(25, 'Wood, Gray and Edwards', 'Gym', 'South Kristinstad', 2),
(26, 'Nelson and Sons', 'Park', 'South Paulchester', 3),
(27, 'Baker LLC', 'Shopping Mall', 'West Sydney', 4),
(28, 'Johnson-Johnson', 'Library', 'New Laura', 5),
(29, 'Carter Inc', 'Cafe', 'East Michaelton', 3),
(30, 'Lopez Group', 'Restaurant', 'Lake Benjamin', 1),
(31, 'Hernandez-Campbell', 'Gym', 'East Nicole', 2),
(32, 'Diaz Ltd', 'Park', 'South Kevin', 4),
(33, 'Powell-Price', 'Shopping Mall', 'Port Gabriellaberg', 3),
(34, 'Parker LLC', 'Library', 'Lake Michelemouth', 5),
(35, 'Brooks-Collins', 'Cafe', 'New Katie', 4),
(36, 'Kelly-James', 'Restaurant', 'North Markfort', 2),
(37, 'Sanders LLC', 'Gym', 'Port Sarahville', 3),
(38, 'Morris-Cruz', 'Park', 'East Tammyville', 4),
(39, 'Mitchell-Watson', 'Shopping Mall', 'West Lauraborough', 5),
(40, 'Reed LLC', 'Library', 'New Donaldstad', 2);


INSERT INTO `Apartment` (`alumID`, `beds`, `baths`, `rent`, `description`, `dateAvailableFrom`, `dateAvailableTo`, `street`, `city`, `state`, `country`) VALUES
(1, 2, 1, 1200, 'Cozy apartment ideal for a single professional or a couple.', '2024-12-01 08:00:00', '2025-01-31 18:00:00', 101, 'New York', 'NY', 'USA'),
(2, 3, 2, 1800, 'Spacious apartment with modern amenities and great views.', '2024-12-10 09:00:00', '2025-02-15 18:00:00', 202, 'Los Angeles', 'CA', 'USA'),
(3, 1, 1, 900, 'Affordable one-bedroom apartment in a quiet neighborhood.', '2024-11-25 07:00:00', '2025-01-20 19:00:00', 303, 'Chicago', 'IL', 'USA'),
(4, 2, 2, 1500, 'Perfect for small families, located near schools and parks.', '2024-12-05 10:00:00', '2025-01-31 20:00:00', 404, 'Seattle', 'WA', 'USA'),
(5, 3, 3, 2100, 'Luxury apartment with premium fittings and secure parking.', '2024-12-15 09:00:00', '2025-02-10 17:00:00', 505, 'Austin', 'TX', 'USA'),
(6, 1, 1, 1000, 'Simple and affordable apartment near public transport.', '2024-12-12 11:00:00', '2025-01-29 18:00:00', 606, 'Boston', 'MA', 'USA'),
(7, 2, 1, 1300, 'Comfortable two-bedroom apartment in a vibrant area.', '2024-12-20 08:00:00', '2025-02-05 17:00:00', 707, 'Denver', 'CO', 'USA'),
(8, 3, 2, 1900, 'Newly renovated apartment with a spacious living room.', '2024-12-08 07:30:00', '2025-02-20 16:00:00', 808, 'San Diego', 'CA', 'USA'),
(9, 1, 1, 950, 'Affordable apartment in a quiet residential neighborhood.', '2024-11-30 08:00:00', '2025-01-15 19:00:00', 909, 'Miami', 'FL', 'USA'),
(10, 4, 3, 2500, 'Large apartment ideal for big families or roommates.', '2024-12-01 09:00:00', '2025-02-28 18:00:00', 1001, 'Dallas', 'TX', 'USA'),
(11, 2, 2, 1400, 'Modern apartment close to shopping and dining options.', '2024-12-14 08:30:00', '2025-02-01 19:00:00', 1101, 'Phoenix', 'AZ', 'USA'),
(12, 3, 2, 2000, 'Stylish apartment with a fully equipped kitchen.', '2024-12-18 07:45:00', '2025-02-15 20:00:00', 1201, 'San Francisco', 'CA', 'USA'),
(13, 1, 1, 1100, 'Cozy apartment with a great view of the city.', '2024-12-09 09:15:00', '2025-01-30 19:00:00', 1301, 'New Orleans', 'LA', 'USA'),
(14, 2, 1, 1500, 'Perfect location for working professionals.', '2024-11-28 10:30:00', '2025-02-10 18:00:00', 1401, 'Nashville', 'TN', 'USA'),
(15, 3, 2, 1800, 'Spacious apartment with a large living area.', '2024-12-03 08:15:00', '2025-01-25 19:00:00', 1501, 'Portland', 'OR', 'USA'),
(16, 1, 1, 1200, 'Bright and airy apartment with modern appliances.', '2024-12-10 09:45:00', '2025-01-29 18:30:00', 1601, 'Las Vegas', 'NV', 'USA'),
(17, 2, 1, 1300, 'Recently renovated apartment with hardwood floors.', '2024-12-05 08:00:00', '2025-02-20 19:00:00', 1701, 'San Antonio', 'TX', 'USA'),
(18, 3, 3, 2100, 'Luxury apartment with amenities like a pool and gym.', '2024-12-18 07:30:00', '2025-02-15 20:00:00', 1801, 'Atlanta', 'GA', 'USA'),
(19, 1, 1, 1000, 'Affordable and comfortable apartment for students.', '2024-11-26 09:00:00', '2025-01-20 18:00:00', 1901, 'Baltimore', 'MD', 'USA'),
(20, 2, 2, 1600, 'Family-friendly apartment near parks and schools.', '2024-12-12 08:30:00', '2025-01-31 19:00:00', 2001, 'Orlando', 'FL', 'USA'),
(21, 3, 2, 1800, 'Stylish unit located in the heart of the city.', '2024-12-20 09:00:00', '2025-02-28 18:30:00', 2101, 'Charlotte', 'NC', 'USA'),
(22, 4, 3, 2400, 'Premium apartment with top-tier facilities.', '2024-12-07 08:15:00', '2025-01-25 19:00:00', 2201, 'Indianapolis', 'IN', 'USA'),
(23, 1, 1, 950, 'Simple apartment for budget-conscious renters.', '2024-12-15 08:45:00', '2025-02-10 18:15:00', 2301, 'Columbus', 'OH', 'USA'),
(24, 2, 2, 1400, 'Modern living space with convenient amenities.', '2024-12-09 09:30:00', '2025-01-30 19:45:00', 2401, 'Milwaukee', 'WI', 'USA'),
(25, 3, 3, 2000, 'Spacious apartment with a dedicated workspace.', '2024-12-05 08:00:00', '2025-02-20 20:00:00', 2501, 'Salt Lake City', 'UT', 'USA'),
(26, 1, 1, 1150, 'Bright apartment located near public transport.', '2024-12-17 09:15:00', '2025-01-31 19:15:00', 2601, 'Austin', 'TX', 'USA'),
(27, 2, 2, 1550, 'Family-friendly neighborhood, ideal for kids.', '2024-11-28 08:45:00', '2025-01-30 18:30:00', 2701, 'Denver', 'CO', 'USA'),
(28, 4, 3, 2200, 'Luxury living with cityscape views.', '2024-12-08 07:30:00', '2025-02-15 20:00:00', 2801, 'Phoenix', 'AZ', 'USA'),
(29, 3, 2, 1700, 'Comfortable living space with modern design.', '2024-12-12 08:00:00', '2025-01-20 19:30:00', 2901, 'Las Vegas', 'NV', 'USA'),
(30, 2, 1, 1250, 'Affordable and cozy space for small families.', '2024-12-14 09:00:00', '2025-02-01 19:45:00', 3001, 'Portland', 'OR', 'USA'),
(31, 3, 2, 1800, 'Modern apartment with city views and updated kitchen.', '2024-12-15 09:00:00', '2025-02-15 18:00:00', 3101, 'Seattle', 'WA', 'USA'),
(32, 2, 1, 1400, 'Cozy apartment close to shopping and restaurants.', '2024-12-10 08:30:00', '2025-01-31 19:00:00', 3201, 'Chicago', 'IL', 'USA'),
(33, 1, 1, 950, 'Affordable unit in a quiet neighborhood.', '2024-11-30 07:45:00', '2025-01-15 17:30:00', 3301, 'Austin', 'TX', 'USA'),
(34, 4, 3, 2400, 'Spacious apartment with premium facilities and parking.', '2024-12-20 10:00:00', '2025-02-28 20:00:00', 3401, 'Los Angeles', 'CA', 'USA'),
(35, 3, 2, 1950, 'Bright and airy apartment with open floor plan.', '2024-12-05 08:15:00', '2025-02-20 19:00:00', 3501, 'Denver', 'CO', 'USA'),
(36, 1, 1, 1000, 'Simple apartment, ideal for working professionals.', '2024-11-25 09:30:00', '2025-01-20 18:15:00', 3601, 'San Francisco', 'CA', 'USA'),
(37, 2, 2, 1500, 'Family-friendly apartment in a convenient location.', '2024-12-12 09:45:00', '2025-02-10 19:30:00', 3701, 'San Diego', 'CA', 'USA'),
(38, 3, 2, 1700, 'Stylish apartment with modern design and hardwood floors.', '2024-12-18 07:30:00', '2025-02-28 18:00:00', 3801, 'Miami', 'FL', 'USA'),
(39, 4, 3, 2200, 'Luxury unit with top-tier amenities, including a pool.', '2024-12-09 08:45:00', '2025-01-31 20:00:00', 3901, 'Dallas', 'TX', 'USA'),
(40, 2, 1, 1250, 'Recently updated apartment in a vibrant area.', '2024-12-07 08:00:00', '2025-02-20 19:30:00', 4001, 'Boston', 'MA', 'USA'),
(41, 1, 1, 1100, 'Cozy unit perfect for students or single professionals.', '2024-11-28 09:15:00', '2025-01-25 18:00:00', 4101, 'Baltimore', 'MD', 'USA'),
(42, 3, 2, 1850, 'Spacious apartment with great natural lighting.', '2024-12-10 08:30:00', '2025-02-10 19:45:00', 4201, 'Orlando', 'FL', 'USA'),
(43, 4, 3, 2450, 'High-end apartment with a large balcony and views.', '2024-12-05 07:45:00', '2025-02-28 20:30:00', 4301, 'Atlanta', 'GA', 'USA'),
(44, 2, 2, 1600, 'Comfortable apartment in a family-friendly area.', '2024-12-15 08:45:00', '2025-01-31 18:15:00', 4401, 'Charlotte', 'NC', 'USA'),
(45, 1, 1, 1000, 'Affordable apartment with easy access to downtown.', '2024-12-01 09:30:00', '2025-01-20 19:00:00', 4501, 'Portland', 'OR', 'USA'),
(46, 2, 1, 1300, 'Renovated apartment in a quiet residential neighborhood.', '2024-12-08 09:00:00', '2025-02-15 19:45:00', 4601, 'Salt Lake City', 'UT', 'USA'),
(47, 3, 3, 2100, 'Luxury apartment with a spacious floor plan.', '2024-12-12 10:15:00', '2025-02-28 18:30:00', 4701, 'Indianapolis', 'IN', 'USA'),
(48, 1, 1, 1150, 'Bright and airy unit perfect for a single professional.', '2024-12-18 08:30:00', '2025-01-25 18:00:00', 4801, 'San Antonio', 'TX', 'USA'),
(49, 4, 3, 2300, 'Premium apartment with upgraded kitchen and bath.', '2024-12-20 07:30:00', '2025-02-15 19:30:00', 4901, 'Raleigh', 'NC', 'USA'),
(50, 2, 1, 1250, 'Simple and comfortable apartment near public transport.', '2024-12-05 08:15:00', '2025-02-10 18:15:00', 5001, 'Nashville', 'TN', 'USA'),
(51, 3, 2, 1750, 'Stylish and modern apartment with updated appliances.', '2024-12-10 09:45:00', '2025-02-28 19:15:00', 5101, 'Cleveland', 'OH', 'USA'),
(52, 4, 3, 2500, 'Luxury penthouse with panoramic city views.', '2024-12-15 08:00:00', '2025-02-20 19:30:00', 5201, 'Las Vegas', 'NV', 'USA'),
(53, 2, 2, 1550, 'Family-friendly apartment close to parks and schools.', '2024-12-07 09:30:00', '2025-01-31 18:45:00', 5301, 'Phoenix', 'AZ', 'USA'),
(54, 1, 1, 1100, 'Cozy apartment with a spacious bedroom.', '2024-12-01 09:00:00', '2025-02-05 19:30:00', 5401, 'Oklahoma City', 'OK', 'USA'),
(55, 3, 2, 1950, 'Open layout with plenty of natural light.', '2024-12-08 10:15:00', '2025-01-30 18:15:00', 5501, 'San Jose', 'CA', 'USA'),
(56, 4, 3, 2600, 'Upscale living with luxurious amenities.', '2024-12-18 09:00:00', '2025-02-15 20:00:00', 5601, 'Sacramento', 'CA', 'USA'),
(57, 1, 1, 950, 'Budget-friendly apartment for single tenants.', '2024-12-12 08:30:00', '2025-01-25 18:45:00', 5701, 'Madison', 'WI', 'USA'),
(58, 2, 1, 1300, 'Comfortable apartment in a thriving neighborhood.', '2024-12-03 08:00:00', '2025-02-20 19:15:00', 5801, 'Fort Worth', 'TX', 'USA'),
(59, 3, 2, 1850, 'Spacious unit near downtown attractions.', '2024-12-05 08:15:00', '2025-02-15 18:00:00', 5901, 'Columbus', 'OH', 'USA'),
(60, 4, 3, 2450, 'Luxury apartment with premium finishes and appliances.', '2024-12-09 09:45:00', '2025-02-28 20:15:00', 6001, 'Indianapolis', 'IN', 'USA');

-- Update housingStatus in Student table
UPDATE `Student`
SET `housingStatus` = CASE
    WHEN `housingStatus` = 1 THEN 'Housed'
    WHEN `housingStatus` = 0 THEN 'Not Housed'
    END;